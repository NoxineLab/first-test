#!/bin/bash
    apt update && apt upgrade
#Instalation de java
    apt install default-jre -y

    apt install default-jdk -y
#instal les tools ifconfig
	apt install net-tools -y

#installation des Paquets debian jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

 sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

 apt update

 apt-get install jenkins -y

 cat /var/lib/jenkins/secrets/initialAdminPassword 

 #affiche l'adresse IP
	echo""
	echo "Voici l'adresse pour se connecter sur le navigateur (IPv4)"
	/sbin/ifconfig ens33 | grep inet | awk '{ print $2 }'
	echo ""
