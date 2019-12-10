#ADD            # Copy a file from the host machine to the new docker image. There is an option to use a URL for the file, docker will then download that file to the destination directory.
#CMD            # Used for executing commands when we build a new container from the docker image.
#ENV            # Define an environment variable.
#WORKDIR        # This is directive for CMD command to be executed.
#USER           # Set the user or UID for the container created with the image.


# The base image for building a new image. This command must be on top of the dockerfile.
FROM balenalib/rpi-raspbian:buster
#FROM arm32v7/debian:latest
#FROM multiarch/debian-debootstrap:armhf-buster

MAINTAINER alinpascaru (alin.pascaru@gmail.com)

# Used to execute a command during the build process of the docker image.
RUN apt-get update && apt-get upgrade -y && apt-get install -y apt-utils

RUN apt-get install -y --no-install-recommends \
    xserver-xorg xinit xserver-xorg-video-fbdev lxde lxde-common xserver-xorg-legacy dbus-x11 \
    dbus-x11 x11-apps x11-xserver-utils \
    alsa-base alsa-utils alsa-tools \
    ca-certificates \
    coreutils \
    kodi \
    kodi-inputstream-adaptive \
    libass5 libass9 libbluray2 libcdio13 libcurl3 libcurl4-openssl-dev libegl1 libegl1-mesa libfreetype6 \
    libfribidi0 libfstrcmp0 libgl1 libglew2.0 libglu1-mesa libiso9660-8 liblcms2-2 liblzo2-2 libmariadbclient18 \
    libmicrohttpd12 libmysqlclient20 libnfs8 libnfs11 libpcrecpp0v5 libpython2.7 libraspberrypi0 libsmbclient \
    libtag1v5 libtinyxml2.6.2v5 libxcb-shape0 libxml2 libxrandr2 libxslt1.1 libyajl2 \
    software-properties-common \
    tzdata \
    vainfo \
    \
# cleanup
&& rm -rf \
      /tmp/* \
      /var/lib/apt/lists/* \
      /var/tmp/*

# Kodi directories
#RUN  mkdir -p /config/kodi/userdata >/dev/null 2>&1 || true && rm -rf /root/.kodi && ln -s /config/kodi /root/.kodi \
#      && mkdir -p /data >/dev/null 2>&1

# Enable access/linked directory between the container and the host machine.
VOLUME /config/.kodi
#VOLUME /config/kodi
#VOLUME /data

EXPOSE 8080 9090 9777/udp

# Define the default command that will be executed when the container is running.
ENTRYPOINT ["/usr/bin/kodi-standalone"]
#ENTRYPOINT ["bash", "/usr/bin/kodi-standalone"]
#CMD ["bash", "/usr/bin/kodi-standalone"]
