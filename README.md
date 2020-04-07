# Jenkins installation with Docker


```
$ mkdir jenkins_home
$ docker-compose up --build
# or,
$ docker-compose up -d
$ docker-compose ps
$ sudo docker logs -f sh_jenkins

*************************************************************
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

7f16d6fa6e0d4d4bb04491924dd68448

This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

*************************************************************
*************************************************************
*************************************************************

```

Copy the **password** to proceed and Click **Next**.

Select  "**Install suggested plugins**" and click **Next**.

<img src="./images/1-jenkins-installing.png">

```
Username: jenkins
Password: admin1234
Full name: Jenkins Admin
E-mail address: jenkins@jn.com
```

```
$ sudo docker exec -it sh_jenkins bash
jenkins@7f9fe2511545:/$ uname -a
Linux 7f9fe2511545 4.15.0-91-generic #92~16.04.1-Ubuntu SMP Fri Feb 28 14:57:22 UTC 2020 x86_64 GNU/Linux
jenkins@7f9fe2511545:/$ cat /etc/os-release 
PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
NAME="Debian GNU/Linux"
VERSION_ID="9"
VERSION="9 (stretch)"
VERSION_CODENAME=stretch
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
jenkins@7f9fe2511545:/$ exit
$
$
```

**Installing Docker, Python and NodeJS inside Jenkins-Docker image:**
```
shahjalal:jenkins$ docker ps
CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS              PORTS                               NAMES
f43bd906815e        shahjalalh/jenkins:0.3   "/sbin/tini -- /usr/…"   24 seconds ago      Up 20 seconds       50000/tcp, 0.0.0.0:8099->8080/tcp   sh_jenkins
shahjalal:jenkins$ docker exec -it sh_jenkins bash
jenkins@f43bd906815e:/$ docker --version
Docker version 19.03.8, build afacb8b7f0
jenkins@f43bd906815e:/$ docker-compose --version
docker-compose version 1.25.4, build 8d51620a
jenkins@f43bd906815e:/$ 
jenkins@f43bd906815e:/$ python
Python 2.7.13 (default, Sep 26 2018, 18:42:22) 
[GCC 6.3.0 20170516] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> exit()
jenkins@f43bd906815e:/$ python3
Python 3.5.3 (default, Sep 27 2018, 17:25:39) 
[GCC 6.3.0 20170516] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> exit()
jenkins@f43bd906815e:/$ node -v
v12.16.1
jenkins@f43bd906815e:/$ npm -v
6.13.4
jenkins@f43bd906815e:/$ yarn -v
1.22.0
jenkins@f43bd906815e:/$ exit
exit
shahjalal:jenkins$
```

Browse to http://localhost:8099/