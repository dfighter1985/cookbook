A simple minimal SCM version extraction with Maven and bash example. It writes the version, remote and date to both a source file and the manifest file.

How it works:
* The exec-maven-plugin executes the shell script that extracts the version information, and writes it to a Java source file, and to a properties file.
* The properties-maven-plugin reads the properties file and imports the properties as Maven properties.
* The maven-jar-plugin writes the properties into the manifest file.


Usage:
Building:
mvn clean package

Running:
java -jar ./target/ExtractVersion.jar

It should print the version, date, and remote.

