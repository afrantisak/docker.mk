# docker.mk

As I was building and testing like my fourth or fifth Dockerfile, I got tired of trying to remember all the command-line arguments.  So I threw together a Makefile to save typing and remembering.  I'm not a makefile expert but this gets the job done. 

## Installation:

Two options: install it into a shared area, or just add it as a file into an existing Dockerfile project directory.

### Install it

```sh
git clone git@github.com:afrantisak/docker.mk 
cd docker.mk
sudo make install # copies  to /usr/include
# to uninstall:
sudo make install-clean
```

### OR add to existing Dockerfile project

```sh
cd <existing Dockerfile project dir>
wget https://raw.githubusercontent.com/afrantisak/docker.mk/master/docker.mk
```

## Usage:

Once installed, create a `Makefile` with:

```make
include docker.mk

image_name = <choose your name>

all: docker-image
```

Choose a name wisely -- if you want to upload to [the docker.io registry](https://registry.hub.docker.com/) make sure you prefix with the proper username (`<user_name>/<image_name>`).

## Building and running:
To build your image, simply `make docker-image`.  To run it, `make docker-start`; To stop,`make docker-stop`.  `make docker-debug` will run bash on it.  See the [docker.mk file itself](https://github.com/afrantisak/docker.mk/blob/master/docker.mk) for the full set of commands.  

## Thanks
Thanks to [erlang.mk](https://github.com/ninenines/erlang.mk) for the inspiration.
