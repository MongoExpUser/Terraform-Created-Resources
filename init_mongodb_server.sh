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
#  init_mongodb_server.sh (start-up script) - performes the following actions:                      #
#  1) Installs missing Ubuntu packages                                                              #
#  2) Installs mongodb server                                                                       #
#  3) Set firewall rules for mongodb server                                                         #
#  4) Configures  mongodb server                                                                    #
#...................................................................................................#


#!/bin/bash

# define all common variable(s)
enable_mongodb_server=true

# create relevant functions
# a.
install_missing_packages () {
  # update system
  sudo apt-get update
  sudo apt-get upgrade
  echo -e "Y"
  sudo apt-get dist-upgrade
  echo -e "Y"
      
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
  
  # clean
  sudo apt autoclean
  sudo apt autoremove
}

# b.
install_mongodb_server_and_configure () {
  if [ $enable_mongodb_server = true ]
  then
    # install mongodb (Mongodb v4.4. on Ubuntu 20.04 LTS)
    wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
    sudo apt-get install gnupg
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
    sudo apt-get update
    sudo apt-get install -y mongodb-org
    
    # set firewall rules for ssh (port 22) and mongodb-server
    sudo ufw enable
    echo -e "y"
    sudo ufw allow 22
    sudo ufw allow 27017
    
    # clean
    sudo apt autoclean
    sudo apt autoremove
    
    # create mongodb.service file
    sudo echo '
      [Unit]
      Description=High-performance, schema-free document-oriented database
      After=network.target
  
      [Service]
      User=mongodb
      ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf
  
      [Install]
      WantedBy=multi-user.target
    ' > /etc/systemd/system/mongodb.service
  
    # enable mongodb.service
    sudo systemctl enable mongodb.service
    sudo systemctl enable mongod.service
  
    
    # copy in relevant mongodb config files (replical set (multi nodes) deployment)
    # =============================================================================
    # note 1 - copy files (a) manually on the server or (2) add code to automate copying and settting permission and ownershio
    # note 2 - files include:
    # 1) mongod.conf     - COMPULSORY
    # 2) tls/ssl files   - OPTIONAL for TLS/SSL deployment
    #   a) keyFile:             /etc/ssl/keyFile.key
    #   b) certificateKeyFile:  /etc/ssl/mongodb.pem
    #   c) CAFile:              /etc/ssl/ca.pem
    #sudo chmod 400 /etc/ssl/keyFile.key             # set permission              - do this on each replical
    #sudo chown mongodb:mongodb /etc/ssl/keyFile.key # change ownership to mongodb - do this on each replical
  fi
}


# c. main function to execute other function(s) sequentially
main () {
  install_missing_packages
  install_mongodb_server_and_configure
}

# invoke main
main
