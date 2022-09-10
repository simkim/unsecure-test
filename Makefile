run: docker-image
	docker run --rm -ti --name unsecure-test simkim/unsecure-test

docker-image:
	docker build -t simkim/unsecure-test .

upload:
	docker login 
	docker push simkim/unsecure-test 

unsecure: unsecure.c Makefile
	gcc unsecure.c -o unsecure
	sudo chown 40000.40000 unsecure
	sudo chmod a+s unsecure
	echo "Je l'ai trouvé : 42 !" > secret.file
	sudo chown 40000.40000 secret.file
	sudo chmod 000 secret.file
