docker_cmd = sudo docker     # override if necessary
image_name = my-docker-image # override this with your application name

docker-image:
	$(docker_cmd) build -t $(image_name) .
docker-image-clean:
	$(docker_cmd) rmi $(image_name)

docker-tarball:
	$(docker_cmd) save $(image_name) > $(image_name).tar
	gzip $(image_name).tar
docker-tarball-clean:
	rm -f $(image_name).tar $(image_name).tar.gz

docker-push:
	$(docker_cmd) push $(image_name)

docker-debug:
	$(docker_cmd) run --rm -t -i $(image_name) /bin/bash

docker-start:
	$(docker_cmd) run -P -d $(image_name) > .docker.pid
docker-stop:
	$(docker_cmd) kill `cat .docker.pid`

docker-clean-unused-images:
	$(docker_cmd) rmi $($(docker_cmd) images | grep "^<none>" | awk '{print $3}')
