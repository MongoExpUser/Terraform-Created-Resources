
#...................................................................................................#
#                                                                                                   #
#  @License Starts                                                                                  #
#                                                                                                   #
#  Copyright © 2015 - present. MongoExpUser                                                         #
#                                                                                                   #
#  License: MIT - https://github.com/MongoExpUser/Terraform-Created-Resources/blob/master/LICENSE   #
#                                                                                                   #
#  @License Ends                                                                                    #
#                                                                                                   #
#...................................................................................................#
#  init.sh (start-up script) - performes the following actions:                                     #
#  1) Create relevant directories                                                                   #
#  2) Installs missing Ubuntu packages                                                              #
#  3) Set firewall rules                                                                            #
#  4) Installs Node.js v15.x                                                                        #
#  5) Installs Express Server v5.0.0-alpha.7 and                                                    # 
#  6) Installs other relevant Node.js packages                                                      #
#...................................................................................................#


#!/bin/bash

# create relevant directories
cd /home/
sudo mkdir base1
cd base1
sudo mkdir Server
sudo mkdir Client
    
# update system
sudo apt-get update
sudo apt-get upgrade
echo -e "Y"
sudo apt-get dist-upgrade
echo -e "Y"
    
# clean
sudo apt autoclean
sudo apt autoremove
    
#install additional missing packages
sudo apt-get install sshpass
sudo apt install cmdtest
echo -e "Y"
sudo apt-get install spamassassin
echo -e "Y"
sudo apt-get install snap
sudo apt-get install nmap
echo -e "Y"
sudo apt-get install net-tools
sudo apt-get install aptitude
echo -e "Y"
sudo apt-get install build-essential
echo -e "Y"
sudo apt-get install gcc
    
# set fire-wall rules for ssh (port 22) and web-server (80 & 443)
sudo ufw enable
echo -e "y"
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 443

# install node.js
curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
echo -e "\n"
sudo apt-get install -y nodejs
echo -e "\n"
    
#create node.js' package.json file
sudo echo ' {
  "name": "web-server",
  "version": "2021.1.0",
  "description": "package.json file",
  "license": "MIT",
  "main": "./app.js",
  "dependencies"    :
  {
    "express"       : "*"
  }
}' > package.json
   
          
# install node packages
sudo npm i -g npm
sudo npm i @mysql/xdevapi
sudo npm i bcryptjs
sudo npm i bcrypt-nodejs
sudo npm i bluebird
sudo npm i body-parser
sudo npm i command-exists
sudo npm i compression
sudo npm i connect-flash
sudo npm i cookie-parser
sudo npm i express@5.0.0-alpha.7
sudo npm i express-session
sudo npm i formidable
sudo npm i html-minifier
sudo npm i mariadb
sudo npm i memored
sudo npm i mime
sudo npm i mkdirp
sudo npm i mongodb
sudo npm i mysql
sudo npm i ocsp
sudo npm i python-shell
sudo npm i serve-favicon
sudo npm i serve-index
sudo npm i uglify-js2
sudo npm i uglifycss
sudo npm i uuid
sudo npm i vhost
          
# clean
sudo apt autoclean
sudo apt autoremove
