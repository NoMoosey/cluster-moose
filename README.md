# cluster-moose

# Notes
For the Ansible k8s module to work, you need to make sure you have the following installed:
```shell
$ sudo pip3 install openshift pyyaml kubernetes
```

PVCs might not mount, says something about how they are already busy:
https://longhorn.io/kb/troubleshooting-volume-with-multipath/
