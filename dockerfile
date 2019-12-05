# The base image for building a new image. This command must be on top of the dockerfile.
FROM multiarch/debian-debootstrap:armhf-buster

# Optional, it contains the name of the maintainer of the image.
#MAINTAINER

# Used to execute a command during the build process of the docker image.
RUN

# Copy a file from the host machine to the new docker image. There is an option to use a URL for the file, docker will then download that file to the destination directory.
#ADD

# Define an environment variable.
ENV

# Used for executing commands when we build a new container from the docker image.
CMD

# Define the default command that will be executed when the container is running.
ENTRYPOINT

# This is directive for CMD command to be executed.
WORKDIR

# Set the user or UID for the container created with the image.
USER

# Enable access/linked directory between the container and the host machine.
VOLUME
