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

## Step 4: Add SyncThing to the Dockefile
```
cd $HOME/chiptainer_syncthing
```
