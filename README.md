# Monitor-stock-price-ui
##Overview:
Monitor Stock Price UI is web application which uses the Rest Apis exposed in other project.

##Architecture:
The architecture of this application is similar to that of the Rest Apis. This also uses MVC architecture. Only difference between both the applications is that, instead of accessing the Database the DAO calls Rest APIs through HTTP connection.
Build and deployment:

##Pre requisites:

1)	Java

2)	Maven

3)	Apache Tomcat Server

4)	Rest APIs are up and running in default Port 8080

##Build:
•	Clone the repository by following command.
>$ git clone https://github.com/kasturivarun/Monitor-stock-price-ui.git

•	Go to the project home folder build the maven project by following command.
>$ mvn clean package
    
    Note: The packaging attribute in pom.xml is war. Therefore a war file will be generated in target folder of the project

•	Now that you have the project war. Copy the war to the webapps folder of the Apache tomcat server.

•	Rest API server is running on port 8080. Therefore configure Tomcat to port 8081.

•	Navigate to /tomcat-root/conf folder. Within you will find the server.xml file. Just change the connector port from default 8080 to 8081

•	Go to the bin folder and start tomcat by clicking startup.bat

•	You can access the web applicaton from http://localhost:8081/stock-ui/
