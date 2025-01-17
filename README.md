# TldDoc

Clone of `Tag Library Documentation Generator`

Full [CHANGELOG](CHANGELOG.md)

For documentation see [https://weblegacy.github.io/tlddoc](https://weblegacy.github.io/tlddoc)

## Building TldDoc

### Prerequisites

* Apache Maven 3.6.3\+
* JDK 11\+

### MAVEN-Profiles

* *assembly*
  * Create assemblies for distribution
* *release*
  * Signs all of the project's attached artifacts with GnuPG
  * Add JavaDoc-artifact for deployment to central-repo
  * Add Source-artifact for deployment to central-repo

### Building-Steps

1. Clean full project  
   `mvn clean`
2. Build and test project  
   `mvn verify`
3. Generate site-documentation  
   `mvn site`
4. Publish site-documentation  
   `mvn site-deploy`
5. Generate source-, javadoc-artifacts  
   `mvn package`
6. Generate assemblies  
   `mvn -Passembly package`
7. Deploy all artifacts to `Central-Repo`
   * `mvn clean deploy` for SNAPSHOTs
   * `mvn -Prelease clean deploy` for releases

### Support runs

* Set version number  
  `mvn versions:set -DnewVersion=...`
* Dependency Report  
  `mvn -Passembly,release versions:display-dependency-updates versions:display-plugin-updates versions:display-property-updates`
