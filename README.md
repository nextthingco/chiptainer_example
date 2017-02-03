# CHIPtainer Example

Use this project as base for a custom build CHIPtainer image.
The following explains how to create a CHIPtainer image running the Nginx web server.

## Sytem requirements
In order to build your own customized CHIPtainer image you need a computer
that is running  Mac OS X or Debian/Ubuntu and has Docker installed.
Instructions how to install Docker can be found on the
[official Docker website](https://docs.docker.com/engine/getstarted/step_one/#step-1-get-docker).

## Step 1: Fork the example
Login to ntc.githost.io and fork the [CHIPtainer Example](https://ntc.githost.io/NextThingCo/chiptainer_example) project.
Assuming your username on ntc.githost.io is `WINSTONSMITH`, you should have a project https://ntc.githost.io/WINSTONSMITH/chiptainer_example

## Step 2: Rename the project
As we are going to make this an Nginx CHIPtainer, let's rename the project to
`https://ntc.githost.io/WINSTONSMITH/chiptainer_nginx`

_TODO: explain how to do that --^_

## Step 3: Checkout the repository on your local computer
```
git clone https://ntc.githost.io/WINSTONSMITH/chiptainer_nginx $HOME/chiptainer_nginx
```

## Step 4: Add Nginx
```
cd $HOME/chiptainer_syncthing
vi Dockerfile
```

Modify the Dockerfile:
```
FROM ntc-registry.githost.io/nextthingco/chiptainer_alpine

MAINTAINER Chippy Ruxpin <software@nextthing.co>

RUN \
apk update && \
apk add nginx  &&\
rm -rf /tmp/* /var/tmp/* /var/run/nginx /etc/nginx/nginx.conf && \
mkdir /var/run/nginx && \
chown nginx /var/run/nginx && \
chmod 777 /var/run/nginx && \
ln -sf /dev/stdout /var/log/nginx/docker-access.log && \
ln -sf /dev/stderr /var/log/nginx/docker-error.log

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./www/index.html /www/index.html
CMD ["nginx","-g","daemon off;"]
```

Add index.html:
```
<html>

<head>
<style>
body {
    margin: 0 auto;
    max-width: 50em;
    padding: 4em 1em;
    color: #566b78;
}

td { padding: 0.1em 1em; }
</style>
</head>

<body>
<table style="font-size:40pt">
<tr><td>CHIP</td><td>&#x1F440;</td><td></td></tr>
<tr><td></td>    <td>&#x1F445;</td><td>online</td></tr>
</table>
</body>

</html>
```

Add nginx.conf:
```
user                            nginx;
worker_processes                1;

error_log                       /var/log/nginx/error.log warn;
pid                             /var/run/nginx.pid;

events {
    worker_connections          1024;
}

http {
    include                     /etc/nginx/mime.types;
    default_type                application/octet-stream;
    sendfile                    on;
    access_log                  /var/log/nginx/access.log;
    keepalive_timeout           3000;
    server {
        listen                  80;
        root                    /www;
        index                   index.html index.htm;
        server_name             localhost;
        client_max_body_size    32m;
        error_page              500 502 503 504  /50x.html;
        location = /50x.html {
              root              /var/lib/nginx/html;
        }
    }
}
```

## Step 5: Build & run on local machine

To build the docker image type:
```
./build.sh
```

To run it locally type:
```
docker run -d --name nginx -p 80:80 chiptainer_nginx
```

In your web browser open the folllowing url:
```
http://127.0.0.1
```

Tear down the container:
```
docker stop nginx
docker rm nginx
```

Delete the local container image:
```
docker rmi chiptainer_gnix
```

## Step 7: Build on ci server

Commit the changes:
```
git add .
git commit -a -m "added Nginx"
git push
```

The push will automatically trigger a build that generates a new CHIPtainer image.

## Step 5: Use the container
```
docker login ntc-registry.githost.io
docker run  \
 -p 80:80 -p 22000:22000 -p 21027:21027/udp \
 -v -v -v ntc-registry.githost.io/WINSTONSMITH/chiptainer_syncthing
```

