# docker-alfresco

Containerised alfresco

* Enter working dir

`cd docker-alfresco`

* First you need to build the depended-upon 'marsbard/tomcat' image

`tomcat/build.sh`

* Get all the wars etc (eventually this will be folded into the images)

`./get.sh`


* Compose

`docker-compose build`


* Run

`docker-compose up`


You will find various folders being created under /data on your docker host - this could be mapped to a network
drive first if you like; then shutting down an instance on one docker host, you could resurrect the instance on
a second docker host and it would have access to all the data from the network drive.
