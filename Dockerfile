# Docker container with chef-solo & berkshelf
FROM ubuntu:12.04
MAINTAINER Paul B. "paul+swcc@bonaud.fr"

RUN apt-get -y update

# Install Chef
RUN apt-get -y install curl build-essential libxml2-dev libxslt-dev git
RUN curl -L https://www.opscode.com/chef/install.sh | bash
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Install Berkshelf with chef's own ruby
RUN /opt/chef/embedded/bin/gem install berkshelf

# Cleanup
RUN apt-get autoremove
RUN apt-get clean
