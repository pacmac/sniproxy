#apt-get -y update
#apt-get -y install build-essential autotools-dev cdbs debhelper dh-autoreconf dpkg-dev gettext libev-dev libpcre3-dev libudns-dev pkg-config fakeroot git udns-utils libudns-dev libudns0 ufw 

## LOCALE
echo "export LANGUAGE=en_US.UTF-8" >> /etc/bash.bashrc
echo "export LANG=en_US.UTF-8" >> /etc/bash.bashrc
echo "export LC_ALL=en_US.UTF-8" >> /etc/bash.bashrc
echo "locale-gen en_US.UTF-8" >> /etc/bash.bashrc
source /etc/bash.bashrc

## Install SNIPROXY
git clone https://github.com/dlundquist/sniproxy.git 
cd sniproxy*
compile ./autogen.sh && dpkg-buildpackage 
./autogen.sh && dpkg-buildpackage

cd ../
dpkg -i sniproxy*_amd64.deb

## CONFIG SNIPROXY
mv /etc/sniproxy.conf /etc/sniproxy.conf.orig
cp -rp ./sniproxy.conf /etc/sniproxy.conf
nano /etc/sniproxy.conf 

## START & TEST
/usr/sbin/sniproxy
ps aux | grep sni
tail -f /var/log/sniproxy/https_access.log

## UFW
ufw allow from 45.119.154.253
ufw enable

## IPLAYER
mkdir -p /usr/share/multimedia/video/tv/
mkdir -p /usr/share/multimedia/audio/radio/
add-apt-repository -y ppa:jon-hedgerows/get-iplayer
apt-get -y update
apt-get -y install get-iplayer
get_iplayer --pvr
cd ~/sniproxy
cp -rp options ~/.get_iplayer/


