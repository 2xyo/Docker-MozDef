Docker-MozDef
=============

Automated build of "MozDef: The Mozilla Defense Platform" with Docker.io

Dockerfile
----------
Use this to build a new image

	$ git clone https://github.com/2xyo/Docker-MozDef.git
    $ cd Docker-MozDef && sudo make build 

Running the container

    $ && sudo make run .

Now go to:

 * http://127.0.0.1:9090 < elasticsearch
 * http://127.0.0.1:8080 < loginput
 * http://127.0.0.1:8081 < rest api

