# docker.mk

As I was building and testing yet another Dockerfile, I threw together a Makefile to save typing and remembering all the command-line arguements.  I'm not a makefile expert but this gets the job done. 

## Installation:

Two options: install it into a shared area, or just copy it and drop it into a Dockerfile project directory.

### Install it

```sh
git clone git@github.com:afrantisak/docker.mk 
cd docker.mk
sudo make install # copies  to /usr/include
# to uninstall:
sudo make install-clean
```
### Add it to a Dockerfile project

```sh
cd <existing Dockerfile project dir>
wget https://raw.githubusercontent.com/afrantisak/docker.mk/master/docker.mk
```

## Usage:

Once installed, create a `Makefile` with:

```make
include docker.mk

image_name = <choose your name>
```

Choose a name wisely.  If you want to upload to [docker.io](https://registry.hub.docker.com/) make sure you prefix with the proper username (`<username>/image_name>`).

Then to build it, simply `make`.  To run it, `make start`; To stop,`make stop`.  `make debug` will run bash on it.  
See the [docker.mk file itself](https://github.com/afrantisak/docker.mk/blob/master/docker.mk) for the full set of commands.

Thanks to [erlang.mk](https://github.com/ninenines/erlang.mk) for the inspiration.
