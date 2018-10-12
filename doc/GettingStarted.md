## Getting Started with Salt Open Source

### Introduction
Salt is an open source platform for configuration management of operating system and application infrastructure.

### References
https://docs.saltstack.com/en/latest/topics/installation/rhel.html

#### CentOS/RHEL installation

Add the SaltStack repo to the yum configuration
Save in a file named /etc/yum.repos.d/SaltStack.repo

```
[saltstack-repo]
name=SaltStack repo for Red Hat Enterprise Linux $releasever
baseurl=https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest
enabled=1
gpgcheck=1
gpgkey=https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest/SALTSTACK-GPG-KEY.pub
       https://repo.saltstack.com/yum/redhat/$releasever/$basearch/latest/base/RPM-GPG-KEY-CentOS-7
```

Validate that salt packages are found in the new repo.

```yum search salt```

Install packages needed for a Salt Master role.

```yum -y install salt-master```

```yum -y install salt-minion```

```yum -y install salt-ssh```

```yum -y install salt-syndic```

```yum -y install salt-cloud```

Install packages needed for a Salt Minion role.

```yum -y install salt-minion```

Post installation

Master: Set the master to automatically start upon boot.

```systemctl enable salt-master.service```

Start the service
```systemctl start salt-master.service```

Minion: Set the minion process to automatically start upon boot.

```systemctl enable salt-minion.service```

Start the service

```systemctl start salt-minion.service```

### Host Name Resolution

Since the hosts running on Azure currently do not have DNS resolution, we will
configure a local hosts file to use familiar names

Add the following to /etc/hosts:
```10.0.1.4        salt salt.local```

### Key management
Salt minion host keys must be accepted/authorized on the master before they will
be trusted.

* List keys

```salt-key -L```

```
[root@SaltMaster ecrossman]# salt-key
Accepted Keys:
Denied Keys:
Unaccepted Keys:
MediaWiki
Rejected Keys:
```

* Accept key

``` salt-key -a MediaWiki```

### Test Minion Communication
Send test 'ping' to all connected minions
```salt '*' test.ping```
