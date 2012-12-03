set -e

# Installing Adobe Air Runtime
cd /tmp
wget http://airdownload.adobe.com/air/lin/download/2.6/adobeair.deb
mkdir adobeair
dpkg-deb -x adobeair.deb adobeair
dpkg-deb --control adobeair.deb adobeair/DEBIAN
sed -i "s/i386/all/" adobeair/DEBIAN/control
dpkg -b adobeair adobeair_64.deb

set +e
sudo dpkg -i adobeair_64.deb
if [ $? -ne 0 ]; then
  sudo apt-get -f install
fi
set -e

rm -rf adobeair adobeair_64.deb

# Installing Adobe Air SDK
mkdir -p /home/vagrant/air-sdk
cd /home/vagrant/air-sdk
wget http://airdownload.adobe.com/air/lin/download/2.6/AdobeAIRSDK.tbz2
tar xjf AdobeAIRSDK.tbz2
rm AdobeAIRSDK.tbz2
# Add Air SDK tools to path
echo 'export PATH="$PATH:/home/vagrant/air-sdk/bin"' >> /home/vagrant/.bashrc
