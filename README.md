# CHIPtainer Example

Use this project as base for a custom build CHIPtainer image.

In the followin we explain how to create a CHIPtainer image that includes
[SyncThing](https://syncthing.net/) - a private, decentral, encrypted open-source alternative to
Dropbox or Resilio Sync (formerly BitTorrent Sync).

## Sytem requirements
In order to build your own customized CHIPtainer image you need a computer
that is running  Mac OS X or Debian/Ubuntu and has Docker installed.
Instructions how to install Docker can be found on the
[official Docker website](https://docs.docker.com/engine/getstarted/step_one/#step-1-get-docker).

## Step 1: Fork the example
Login to ntc.githost.io and fork the [CHIPtainer Example](https://ntc.githost.io/NextThingCo/chiptainer_example) project.
Assuming your username on ntc.githost.io is `winstonsmith`, you should have a project https://ntc.githost.io/winstonsmith/chiptainer_example

## Step 2: Rename the project
As we are going to make this a Syncthing CHIPtainer, let's rename the project to
`https://ntc.githost.io/winstonsmith/chiptainer_syncthing`

_TODO: explain how to do that --^_

## Step 3: Checkout the repository on your local computer
```
git clone https://ntc.githost.io/winstonsmith/chiptainer_syncthing $HOME/chiptainer_syncthing
```

## Step 4: Add SyncThing
```
cd $HOME/chiptainer_syncthing
vi Dockerfile
```

Modify the Dockerfile:
```
FROM ntc-registry.githost.io/nextthingco/chiptainer_alpine:master

RUN apk update && apk add syncthing

RUN echo "Hello Syncthing"
```

Commit the changes:
```
git commit -a -m "added SyncThing"
git push
```

The push will automatically trigger a build that generates a new CHIPtainer image.

## Step 5: Use the container
```
docker login ntc-registry.githost.io
docker run  \
 -p 8384:8384 -p 22000:22000 -p 21027:21027/udp \
 -v -v -v ntc-registry.githost.io/WINSTONSMITH/chiptainer_syncthing
```

