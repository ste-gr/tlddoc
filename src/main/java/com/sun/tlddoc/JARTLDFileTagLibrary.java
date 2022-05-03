/*
 * <license>
 * Copyright (c) 2003-2004, Sun Microsystems, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of Sun Microsystems, Inc. nor the names of its
 *       contributors may be used to endorse or promote products derived from
 *       this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * ROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * </license>
 */

package com.sun.tlddoc;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.transform.TransformerException;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 * Tag library that gets its information from a TLD file in a JAR.
 *
 * @author  mroth
 */
public class JARTLDFileTagLibrary extends TagLibrary {

    /**
     * The JAR containing the TLD file
     */
    final private File jar;

    /**
     * The name of the JarEntry containing the TLD file
     */
    final private String tldPath;

    /**
     * Creates a new instance of JARTLDFileTagLibrary
     *
     * @param jar JAR containing the TLD file
     * @param tldPath name of the JarEntry containing the TLD file
     */
    public JARTLDFileTagLibrary( File jar, String tldPath ) {
        this.jar = jar;
        this.tldPath = tldPath;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public String getPathDescription() {
        return jar.getAbsolutePath() + "!" + tldPath;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public InputStream getResource(String path)
        throws IOException
    {
        InputStream result = null;
        if( path.startsWith( "/" ) ) path = path.substring( 1 );
        JarFile jarFile = new JarFile( this.jar );
        JarEntry jarEntry = jarFile.getJarEntry( path );
        if( jarEntry != null ) {
            result = jarFile.getInputStream( jarEntry );
        }

        // XXX - JAR File is left unclosed.

        return result;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Document getTLDDocument(DocumentBuilder documentBuilder)
        throws IOException, SAXException, TransformerException
    {
        Document result = null;
        try ( JarFile jarFile = new JarFile( this.jar ) ) {
            JarEntry jarEntry = jarFile.getJarEntry( this.tldPath );
            if( jarEntry != null ) {
                InputStream in = jarFile.getInputStream( jarEntry );
                InputSource source;
                try {
                    source = new InputSource( in );
                    result = documentBuilder.parse( source );
                }
                finally {
                    in.close();
                }
            }
        }
        return result;
    }

}