Docker image with Glassfish Open Source 4.1
=====================

Docker custom image that runs a Glassfish Open Source 4.1 application server domain.


Usage
-----

To build this image, execute the following command on the build context:

	docker build -t fturizo/oel-glassfish .

To run the image and bind the respective ports :

	docker run -d -p 4848:4848 -p 8080:8080 -p fturizo/oel-glassfish
