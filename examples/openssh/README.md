OpenSSH daemon
======

You can pull the container from [index.docker.io](https://index.docker.io/u/swcc/chef-solo/) with:
```
sudo docker pull swcc/openssh-example
```

or build it yourself
```
sudo docker build -t swcc/openssh-example .
```

Set the root password
==
```
sudo docker run -i -t swcc/openssh-example /bin/bash
$ passwd
```

Run the ssh service
==

```
CONTAINER_ID=$(sudo docker run -d -p 22 swcc/openssh-example /usr/sbin/sshd -D)
```

Connect to the newly created SSH service
==

Find out the ip adress of the container
```
sudo docker inspect $CONTAINER_ID | grep IPAddress | cut -d '"' -f 4
```

and connect!
```
ssh root@x.x.x.x
```