FROM swcc/chef-solo
MAINTAINER Paul B. "paul+swcc@bonaud.fr"

# Ugly hack for Ubuntu. See https://github.com/dotcloud/docker/issues/1024
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

ADD . /chef
RUN cd /chef && /opt/chef/embedded/bin/berks install --path /chef/cookbooks
RUN chef-solo -c /chef/solo.rb -j /chef/solo.json

# Hack to create a privilege separation directory for sshd
RUN mkdir /var/run/sshd

CMD ["/usr/sbin/sshd"]
