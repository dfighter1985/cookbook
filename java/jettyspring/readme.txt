This project demonstrates the use of the Jetty Maven plugin:
It allows you to quickly prototype and run your servlet using Maven. In this particular example I use a very basic Spring-MVC app as the servlet itself.

Usage:
mvn clean package jetty:run

After Jetty starts open the following with your browser:
http://localhost:8080

Depending on your system you can stop Jetty with either Ctrl+C or killing the java process that is running it.
