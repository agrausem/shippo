#!/bin/bash
#### RUN AS ROOT
#### INSTALL JAVA
# wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.rpm
# rpm -i jdk-8u91-linux-x64.rpm
#### Set JAVA home
# echo 'export JAVA_HOME=/usr/java/latest/' >> ~/.bashrc
# echo 'export JAVA_OPTS="-Xmx1000m"' >> ~/.bashrc
#### Security policy java more robust
# wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip
# unzip jce_policy-8.zip 
# mv UnlimitedJCEPolicyJDK8/* /usr/java/jdk1.8.0_xx/jre/lib/security/
#### Tomcat
# cd /tmp/
# wget https://www.apache.org/dist/tomcat/tomcat-8/v8.0.35/bin/apache-tomcat-8.0.35.tar.gz
# wget https://www.apache.org/dist/tomcat/tomcat-8/v8.0.35/bin/apache-tomcat-8.0.35.tar.gz.asc
# wget -O KEYS https://www.apache.org/dist/tomcat/tomcat-8/KEYS
# gpg --import KEYS
# gpg --verify apache-tomcat-8.0.35.tar.gz.asc
# tar -zxvf apache-tomcat-8.0.35.tar.gz
# mv apache-tomcat-8.0.35 /opt/
# cd /opt 
# ln -s apache-tomcat-8.0.35 tomcat
# wget -O /opt/tomcat/lib/jstl-1.2.jar https://build.shibboleth.net/nexus/service/local/repositories/thirdparty/content/javax/servlet/jstl/1.2/jstl-1.2.jar
# echo "export CATALINA_HOME=/opt/tomcat" >> ~/.bashrc

# /usr/sbin/useradd tomcat
# wget https://test.federation.renater.fr/exemples/conf_idp3/tomcat -O /etc/init.d/tomcat
# chown tomcat /etc/init.d/tomcat
# chmod 755 /etc/init.d/tomcat
# sudo chown -R tomcat /opt/apache-tomcat-8.0.35
# service tomcat start
#### APACHE
# echo "ProxyPass /idp/ ajp://127.0.0.1:8009/idp/ retry=0" >> /etc/httpd/conf.d/shibboleth.conf
# echo "ProxyPass /examples/ ajp://127.0.0.1:8009/examples/" >> /etc/httpd/conf.d/shibboleth.conf
# service httpd restart
#### Certificat
# wget -O /etc/pki/tls/private/fed08.formation.renater.fr.key http://test.federation.renater.fr/formation/fed08.formation.renater.fr.key
# chmod 600 /etc/pki/tls/private/fed08.formation.renater.fr.key
# wget -O /etc/pki/tls/certs/fed08.formation.renater.fr.crt http://test.federation.renater.fr/formation/fed08.formation.renater.fr.crt
# chmod 644 /etc/pki/tls/certs/fed08.formation.renater.fr.crt
# wget -O /etc/pki/tls/certs/server-cachain.txt http://test.federation.renater.fr/formation/server-cachain.txt
# chmod 644 /etc/pki/tls/certs/server-cachain.txt
# echo "SSLCertificateFile /etc/pki/tls/certs/fed08.formation.renater.fr.crt" >> /etc/httpd/conf.d/ssl.conf
# echo "SSLCertificateKeyFile /etc/pki/tls/private/fed08.formation.renater.fr.key" >> /etc/httpd/conf.d/ssl.conf
# echo "SSLCertificateChainFile /etc/pki/tls/certs/server-cachain.txt" >> /etc/httpd/conf.d/ssl.conf

### IDP
# mkdir /opt/src
# cd /opt/src
# wget http://shibboleth.net/downloads/identity-provider/3.2.1/shibboleth-identity-provider-3.2.1.zip
# wget -O KEYS http://shibboleth.net/downloads/PGP_KEYS
# wget http://shibboleth.net/downloads/identity-provider/3.2.1/shibboleth-identity-provider-3.2.1.zip.asc
# gpg --import KEYS
# gpg --verify shibboleth-identity-provider-3.2.1.zip.asc
# unzip shibboleth-identity-provider-3.2.1.zip
# cd /opt/src/shibboleth-identity-provider-3.2.1/
# ./bin/install.sh
# chown -R tomcat /opt/shibboleth-idp/ 
#### TOMCAT CONF
# mkdir -p /opt/tomcat/conf/Catalina/localhost/
# echo '    <Context docBase="/opt/shibboleth-idp/war/idp.war"
#             privileged="true"
#             antiResourceLocking="false"
#             swallowOutput="true" /> ' >> /opt/tomcat/conf/Catalina/localhost/idp.xml

# chown tomcat /opt/apache-tomcat-8.0.35/conf/Catalina/localhost/idp.xml
# service tomcat restart


### Configuration IDP
# cd /opt/shibboleth-idp/conf
# cp -p relying-party.xml relying-party.xml.dist
# cp -p attribute-resolver.xml attribute-resolver.xml.dist
# cp -p attribute-filter.xml attribute-filter.xml.dist

# wget -O /opt/shibboleth-idp/credentials/metadata-federation-renater.crt https://federation.renater.fr/test/metadata-federation-renater.crt







