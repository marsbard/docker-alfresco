# docker-alfresco

Containerised alfresco

* Enter working dir

`cd docker-alfresco`

* First you need to build the dependend-upon 'marsbard/tomcat' image

`tomcat/build.sh`

* Get all the wars etc (eventually this will be folded into the images)

`./get.sh`


* Compose

`docker-compose build`


* Run

`docker-compose up`
