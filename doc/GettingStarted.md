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
