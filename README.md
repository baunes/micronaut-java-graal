# Micronaut + Graal Native image example
Example application from https://guides.micronaut.io/micronaut-creating-first-graal-app/guide/index.html

Application created with
mn create-app exaple.micronaut.java-graal --features=graal-native-image

## Use of the project
The project contains a Makefile with the following tasks:
* *build-docker*                   Builds a Graal native Docker image
* *build-mn*                       Builds the mincronaut application as a .jar
* *build-native*                   Builds a native image
* *clean-docker*                   Removes the Docker image
* *clean-mn*                       Cleans the micronaut build files
* *connect-docker*                 Removes the docker container
* *rm-docker*                      Removes the docker container
* *run-docker*                     Runs the docker container
* *stop-docker*                    Runs the docker container
* *help*                           Display this help text

### Build and run the docker image
We can build the docker image with `make native-build` and the run the image with `make run-docker`.

When the image is running we can query the server with `curl http://localhost:8080/conferences/random`.

To delete the container image, and build files we can run `make clean-all`.
