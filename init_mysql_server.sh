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
#  init_mysql_server.sh (start-up script) - performes the following actions:                        #
#  1) Installs missing Ubuntu packages                                                              #
#  2) Installs mysql server                                                                         #
#  3) Set firewall rules for mysql server                                                           #
#...................................................................................................#


#!/bin/bash

# define all common variable(s)
enable_mysql_server=true

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
install_mysql_server () {
  if [ $enable_mysql_server = true ]
  then
    sudo apt-get update
    sudo get-get install mysql-server
    echo -e "Y"
    
    # set firewall rules for ssh (port 22) and mysql server (both RDMS and Document Store)
    sudo ufw enable
    echo -e "y"
    sudo ufw allow 22
    sudo ufw allow 3306
    sudo ufw allow 33060
    echo -e "\n"
    
    # clean
    sudo apt autoclean
    sudo apt autoremove
  fi
}


# c. main function to execute other function(s) sequentially
main () {
  install_missing_packages
  install_mysql_server
}

# invoke main
main
