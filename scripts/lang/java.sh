#!/bin/bash

# install java
sudo apt-get install -y openjdk-17-jdk

# install gradle
sudo apt-get install -y unzip

if [ -e /opt/gradle ]; then
    sudo rm -rf /opt/gradle
fi

curl -fsSL https://services.gradle.org/distributions/gradle-8.3-rc-1-bin.zip -o /tmp/gradle.zip
sudo unzip -d /opt/gtmp /tmp/gradle.zip
sudo mv /opt/gtmp/gradle* /opt/gtmp/gradle
sudo mv /opt/gtmp/gradle /opt/gradle
sudo rm -rf /opt/gtmp
sudo rm -rf /tmp/gradle.zip

rcs=( ~/.bashrc ~/.zshrc )
for rc in ${rcs[@]}; do
    if [ -e $rc ]; then
        echo 'PATH=$PATH:/opt/gradle/bin' | sudo tee -a $rc > /dev/null
    fi
done
