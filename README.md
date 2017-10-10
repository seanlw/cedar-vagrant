# Cedar
Cedar vagrant box

## Requirements

* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

## Usage

1. `git clone https://github.com/seanlw/cedar-vagrant.git`
2. `cd cedar-vagrant`
3. `vagrant up`
4. Visit [http://localhost:8888](http://localhost:8888)

Click the "Login" button and login with `admin@iqvoc`, password: `admin`.
This is the default user with administration privileges.

You can shell into the machine with `vagrant ssh` or `ssh -p 2222 ubuntu@localhost`

Shutdown Cedar with `vagrant halt`

## Environment

* Ubuntu 16.04 64-bit machine with:
  * [iQvoc 4.11.1](http://iqvoc.net/) at [http://localhost:8888](http://localhost:8888)
  * [MySQL](https://www.mysql.com/)
    * username = "root", password = "root"
    * Cedar db = "cedar", username = "cedar", password = "cedar"
  * [Tomcat 7](http://tomcat.apache.org) at [http://localhost:8080/manager](http://localhost:8080/manager)
    * Manager username = "admin", password = "admin"
  * [Fuseki 3.4.0](https://jena.apache.org/documentation/fuseki2/index.html) at [http://localhost:8080/fuseki](http://localhost:8080/fuseki)
  * [Greens](https://github.com/uhlibraries-digital/greens) at [http://id.localhost:8888](http://id.localhost:8888)

## Windows Troubleshooting

If you receive errors involving `\r` (end of line):

Edit the global `.gitconfig` file, find the line:
```
autocrlf = true
```
and change it to
```
autocrlf = false
```
Remove and clone again. This will prevent windows git clients from automatically replacing unix line endings LF with windows line endings CRLF.

## Maintainers

Current maintainers:

* [Sean Watkins](https://github.com/seanlw)

## Thanks

This VM setup was heavily influenced from [Islandora 2.x VM](https://github.com/Islandora-Labs/islandora_vagrant).
