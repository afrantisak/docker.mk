all: image
all-clean: image-clean
clean: image-clean

docker_cmd = sudo docker     # override if necessary
image_name = my-docker-image # override this with your application name

image:
	$(docker_cmd) build -t $(image_name) .
image-clean:
	$(docker_cmd) rmi $(image_name)

tarball:
	$(docker_cmd) save $(image_name) > $(image_name).tar
	gzip $(image_name).tar
tarball-clean:
	rm -f $(image_name).tar $(image_name).tar.gz

push:
	$(docker_cmd) push $(image_name)

debug:
	$(docker_cmd) run --rm -t -i $(image_name) /bin/bash

start:
	$(docker_cmd) run -P -d $(image_name) > .docker.pid
stop:
	$(docker_cmd) kill `cat .docker.pid`

clean-unused-images:
	$(docker_cmd) rmi $($(docker_cmd) images | grep "^<none>" | awk '{print $3}')
