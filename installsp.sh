#!/bin/bash
# wget -O /etc/pki/tls/private/fed08.formation.renater.fr.key http://test.federation.renater.fr/formation/fed08.formation.renater.fr.key
# chmod 600 /etc/pki/tls/private/fed08.formation.renater.fr.key
# wget -O /etc/pki/tls/certs/fed08.formation.renater.fr.crt http://test.federation.renater.fr/formation/fed08.formation.renater.fr.crt
# chmod 644 /etc/pki/tls/certs/fed08.formation.renater.fr.crt
# wget -O /etc/pki/tls/certs/server-cachain.txt http://test.federation.renater.fr/formation/server-cachain.txt
# chmod 644 /etc/pki/tls/certs/server-cachain.txt 

### TODO copy ssl.conf
### TODO copy httpd.conf
 
# wget -O /etc/yum.repos.d/security_shibboleth.repo http://download.opensuse.org/repositories/security://shibboleth/CentOS_7/security:shibboleth.repo
# echo "protect=1" >> /etc/yum.repos.d/security_shibboleth.repo
# wget -O /etc/pki/rpm-gpg/RPM-GPG-KEY-shibboleth-security http://download.opensuse.org/repositories/security:/shibboleth/CentOS_7//repodata/repomd.xml.key
# rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-shibboleth-security

# yum install -y shibboleth
# chown -R shibd /etc/shibboleth
# yum install -y php

#### TODO copy shib.conf

# cd /tmp
# wget https://test.federation.renater.fr/exemples/conf_sp2_renater.tar.gz
# tar -zxvf conf_sp2_renater.tar.gz 
# mv -f conf_sp2/* /etc/shibboleth/ 
# wget https://federation.renater.fr/test/metadata-federation-renater.crt -O /etc/shibboleth/metadata-federation-renater.crt 

#### TODO shibboleth2.xml
# echo "export LD_LIBRARY_PATH=/opt/shibboleth/lib64:$LD_LIBRARY_PATH" >> ~/.bashrc
# service httpd restart
# /usr/sbin/shibd -tc /etc/shibboleth/shibboleth2.xml
# service shibd start 
