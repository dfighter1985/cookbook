This project demonstrates the use of the Cargo Maven plugin. It allows you to deploy a servlet with Maven. The demonstration uses the Tomcat 7.x driver for this, but there are more:
https://codehaus-cargo.github.io/cargo/Home.html

You need to add a user that is authorized to deploy using the admin servlet:
Add the following line to /etc/tomcat-users.xml:
<user username="deployUser" password="deployPassword" roles="manager-script"/>

Build:
mvn clean package

Deploy:
mvn cargo:redeploy

After deploying open the following link in a browser (assuming Tomcat is listening on localhost port 8080):
http://localhost:8080/cargodeploy

