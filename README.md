Arma3 mission replays.

# Prerequisites

* [`sock.dll` / `sock.so` Arma3 server extension](https://bitbucket.org/micovery/sock.dll)
* [NodeJS](https://nodejs.org)/ (0.10 or so?)
* [Redis](http://redis.io/)

# Parts of the whole

* [Server](https://github.com/gruppe-adler/ar3play-server) 
* Arma3-Server
  * [Arma Serveraddon](https://github.com/gruppe-adler/ar3play-addon) (this repo) **OR**
  * [mission script](https://github.com/gruppe-adler/ar3play-examplemission.stratis)
* [Webclient](https://github.com/gruppe-adler/ar3play-web)

# How to build

Mikero Tools are most easily used to build.
It will also display any syntax errors encountered.

PboProject is recommended and can be used either through the GUI or the jenkins.bat

The following parts of the Mikero tool suit is required to build:

* DePBO
* MakePBO
* PboProject
* Rapify

All Mikero tools can be downloaded from https://dev.withsix.com/projects/mikero-pbodll/filespre

## PboProject GUI

Setup your P: drive by double clicking the `mapdisk.bat`

Set the `P:\@ar3play` folder as `Output Mod Folder` and the `P:\ar3play` folder as `Source Folder`. Press `Crunch`

## CLI

Invoke `jenkins.bat` with a free drive as parameter, i.e. `jenkins.bat P:`
