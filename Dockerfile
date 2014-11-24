# Docker container with chef-solo & berkshelf
FROM phusion/baseimage
MAINTAINER Paul B. "paul+swcc@bonaud.fr"

# Apt update
RUN apt-get -y update

# Install Chef
RUN apt-get -y install curl build-essential libxml2-dev libxslt-dev git wget lsb-release
RUN wget https://opscode-omnibus-packages.s3.amazonaws.com/debian/6/x86_64/chefdk_0.3.5-1_amd64.deb
RUN dpkg -i chefdk_0.3.5-1_amd64.deb && rm chefdk_0.3.5-1_amd64.deb
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Cleanup
RUN apt-get autoremove
RUN apt-get clean
