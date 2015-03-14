echo 'Adds Several RPG & EPEL Repositories'
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
rpm -i rpmforge-release-0.5.3-1.el6.rf.*.rpm
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm

echo 'Install Group Development Tools'
yum groupinstall 'Development Tools'

echo 'Install Other Core and Useful Software'
yum install yum install ImageMagick perl-GDGraph libxml2-devel httpd-devel libXpm-devel gmp-devel libicu-devel t1lib-devel aspell-devel openssl-devel bzip2-devel gzip libcurl-devel libjpeg-devel libvpx-devel libpng-devel freetype-devel readline-devel libtidy-devel libxslt-devel mysql mysql-server mysql-devel php php-pdo php-gd php-dom php-mbstring php-mysql php-imap php-ldap php-mcrypt

echo 'Install ProFTP'
yum install proftpd

echo 'Checking for Updates'
yum clean all
yum update

echo 'MySQL Setup'
chkconfig mysqld on
chkconfig httpd on
/etc/init.d/httpd start
/etc/init.d/httpd restart
service iptables restart

echo 'Install Webmin'
wget http://prdownloads.sourceforge.net/webadmin/webmin-1.730-1.noarch.rpm
rpm -U webmin-1.730-1.noarch.rpm

echo 'Install Virtualmin'
wget http://software.virtualmin.com/gpl/scripts/install.sh
chmod +x install.sh
./install.sh

echo 'Install ConfigServer'
rm -fv csf.tgz
wget http://www.configserver.com/free/csf.tgz
tar -xzf csf.tgz
cd csf
sh install.sh
yum install perl-GDGraph
# Install the csf webmin module in:
# Webmin > Webmin Configuration > Webmin Modules >
# From local file > /usr/local/csf/csfwebmin.tgz > Install Module



