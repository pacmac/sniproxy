apt-get -y update
apt-get -y install build-essential autotools-dev cdbs debhelper dh-autoreconf dpkg-dev gettext libev-dev libpcre3-dev libudns-dev pkg-config fakeroot git udns-utils libudns-dev libudns0 ufw 

exit 0;

## Install SNIPROXY
git clone https://github.com/dlundquist/sniproxy.git 
cd sniproxy*
compile ./autogen.sh && dpkg-buildpackage 
./autogen.sh && dpkg-buildpackage
dpkg -i ../sniproxy*_amd64.deb

## UFW
ufw allow from 45.119.154.253
ufw enable
ufw status

## START & TEST
sniproxy
ps aux | grep sni
tail -f /var/log/sniproxy/https_access.log

## LOCALE
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
get_iplayer

## IPLAYER
mkdir -p /usr/share/multimedia/video/tv/
mkdir -p /usr/share/multimedia/audio/radio/

sudo add-apt-repository ppa:jon-hedgerows/get-iplayer
sudo apt-get update
apt-get install get-iplayer
get_iplayer --pvr



