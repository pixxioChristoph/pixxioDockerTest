FROM httpd:2.2

RUN chmod -R a+x /usr/local/apache2/cgi-bin

RUN apt-get update && apt-get install -y \
avahi-daemon \
cifs-utils \
dcraw \
exfat-fuse \
fail2ban \
htop \
imagemagick \
jhead \
libemail-mime-createhtml-perl \
libemail-sender-perl \
libfile-slurp-perl \
libfile-touch-perl \
libimage-exiftool-perl \
libimage-size-perl \
libjson-perl \
libmysql-diff-perl \
libnet-ldap-perl \
libnet-sftp-foreign-perl \
libnet-smtp-ssl-perl \
libnet-ssh2-perl \
libproc-processtable-perl \
libsoap-lite-perl \
libwww-perl \
mc \
mysql-utilities \
ntfs-3g \
ntpdate \
perlmagick \
samba \
sudo \
usbmount \
zip

# NICHT IN URSPRÜNGLICHER DATEI VON PIXXIO

RUN apt-get update && apt-get install -y \
less \
libdbd-mysql-perl \
libdbi-perl \
libswitch-perl \
vim 

COPY ./sudoers /etc/
COPY ./adduser.conf /etc/
COPY ./.bashrc /root/
COPY ./smb.conf /etc/samba/
COPY ./apache.conf /usr/local/apache2/conf/httpd.conf
COPY ./jail.conf /etc/fail2ban/
COPY ./usbmount.conf /etc/usbmount/

RUN crontab -l | { cat; echo "# MySql Datenbank Sicherung"; } | crontab - \
&& crontab -l | { cat; echo "0 3 * * *   mysqldump --password=mysqlROOT pixxio | gzip > /pixxiodata/dbBackup/pixxio.sql.gz"; } | crontab - \
&& crontab -l | { cat; echo "# Zeit syncronisieren"; } | crontab - \
&& crontab -l | { cat; echo "0 2 * * *   /usr/sbin/ntpdate -b time2.one4vision.de >> /var/log/messages"; } | crontab - \
&& crontab -l | { cat; echo "# Start MedienConvert"; } | crontab - \
&& crontab -l | { cat; echo "*/5 * * * *   su www-data -c /srv/www/pixxio-theme/cgi-bin/startConvert.bash > /dev/null 2>&1"; } | crontab -


RUN mkdir /srv/versionen \
&& mkdir /srv/www \
&& mkdir /srv/www/pixxio-theme \
&& mkdir /srv/www/pixxio-theme/cgi-bin \
&& mkdir /srv/www/pixxio-theme/htdocs \
&& mkdir /srv/www/pixxio-theme/logs \
&& touch /srv/www/pixxio-theme/logs/error.log \
&& touch /srv/www/pixxio-theme/logs/access.log \
&& mkdir /pixxiodata \
&& mkdir /pixxiodata/fileArchiv \
&& mkdir /pixxiodata/fileArchiv/home \
&& mkdir /pixxiodata/fileArchiv/home/admin_1 \
&& mkdir /pixxiodata/fileOrigs \
&& mkdir /pixxiodata/fileDownloads \
&& mkdir /pixxiodata/fileCollections \
&& mkdir /pixxiodata/fileShare \
&& mkdir /pixxiodata/fileDuplicates \
&& mkdir /pixxiodata/fileUpload \
&& mkdir /pixxiodata/dbBackup \

&& chown www-data:www-data -R /pixxiodata 

COPY ./pixxio20151209.tgz /srv/www/pixxio-theme/
RUN tar -xvzf /srv/www/pixxio-theme/pixxio20151209.tgz -C /srv/www/pixxio-theme >/dev/null 2>&1

RUN mkdir /srv/www/pixxio-theme/htdocs/workspace/pixxio/cache \
&& ln -s /pixxiodata/fileArchiv /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileArchiv \
&& ln -s /pixxiodata/fileUpload /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileUpload \
&& ln -s /pixxiodata/fileOrigs /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileOrigs \
&& ln -s /pixxiodata/fileDownloads /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileDownloads \
&& ln -s /pixxiodata/fileDuplicates /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileDuplicates \
&& ln -s /pixxiodata/fileCollections /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileCollections \
&& ln -s /pixxiodata/fileShare /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileShare \

&& chmod a+w /srv/www/pixxio-theme/htdocs/workspace/pixxio/cache \
&& chmod a+w /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileUpload \
&& chmod a+w /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileDuplicates \
&& chmod a+w /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileArchiv \
&& chmod a+w /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileOrigs \
&& chmod a+w /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileDownloads \
&& chmod a+w /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileCollections \
&& chmod a+w /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileShare \

&& chown www-data:www-data /srv/www/pixxio-theme/cgi-bin/preTimeStamp.txt \
&& chown www-data:www-data /srv/www/pixxio-theme/cgi-bin/preTimeStampDelete.txt \
&& chown www-data:www-data /srv/www/pixxio-theme/cgi-bin/debugUsbupload.log \
&& chown www-data:www-data /pixxiodata/dbBackup \

&& chown www-data:www-data -R /srv/www/pixxio-theme/htdocs/workspace/pixxio/cache \
&& chown www-data:www-data -R /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileUpload \
&& chown www-data:www-data -R /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileDuplicates \
&& chown www-data:www-data -R /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileArchiv \
&& chown www-data:www-data -R /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileOrigs \
&& chown www-data:www-data -R /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileDownloads \
&& chown www-data:www-data -R /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileCollections \
&& chown www-data:www-data -R /srv/www/pixxio-theme/htdocs/workspace/pixxio/fileShare \

&& chmod a+w /pixxiodata/dbBackup \
&& chmod a+w /srv/versionen \
&& chmod a+w /etc/resolv.conf \
&& chmod a+w /etc/hostname \
&& chmod a+w /etc/hosts \
&& chmod a+w /etc/fstab \

&& openssl genrsa -out /pixxiodata/udid.txt 2048

COPY ./DB_SQL.pm /srv/www/pixxio-theme/cgi-bin/DB_SQL.pm

