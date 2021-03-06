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
#  init_web_server.sh (start-up script) - performes the following actions:                          #
#  1) Create relevant directories                                                                   #
#  2) Installs missing Ubuntu packages                                                              #
#  3) Set firewall rules                                                                            #
#  4) Installs Node.js v15.x                                                                        #
#  5) Installs Express Server v5.0.0-alpha.8 and                                                    #
#  6) Installs other relevant Node.js packages                                                      #
#...................................................................................................#


#!/bin/bash

# define all common variable(s)
enable_web_server=true
base_dir="base"
server_dir="server"
client_dir="client"

 
# create relevant functions
# a.
create_dir_and_install_missing_packages () {
  # create relevant directories
  cd /home/
  sudo mkdir $base_dir
  cd $base_dir
  sudo mkdir $server_dir
  sudo mkdir $client_dir
      
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
install_configure_nodejs_web_server () {
  cd /home/
  cd $base_dir
  
  if [ $enable_web_server = true ]
  then
    # install node.js
    curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
    echo -e "\n"
    sudo apt-get install -y nodejs
    echo -e "\n"
        
    # create node.js' package.json file
    sudo echo ' {
      "name": "Nodejs-Expressjs-Web-Server",
      "version": "2021.1.0",
      "description": "A web server, based on the Node.js-Express.js (NE) stack",
      "license": "MIT",
      "main": "./app.js",
      "dependencies"    :
      {
        "express"       : "*"
      }
    }' > package.json
        
    # install express.js and other node.js packages
    sudo npm i express@5.0.0-alpha.8
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
    
    # set firewall rules for ssh (port 22) and web-server (80 & 443)
    sudo ufw enable
    echo -e "y"
    sudo ufw allow 22
    sudo ufw allow 80
    sudo ufw allow 443
              
    # clean
    sudo apt autoclean
    sudo apt autoremove
    
    # copy in relevant node.js files
    # ==============================
    # note 1 - optional ways to copy files (a) manually on the server or (2) add code to automate copying, if desired
    # note 2 - files include:
    # 1) app.js
    # 2) logger.js and security.js
    # 3) other developed node.js modules (.js files) - routes, handlers & applications (AIML, numerical simulator, database, data analytics, etc.)
    # 4) index.html
    # 5) other html file(s)
    # 6) css file(s)
    # 7) client/front-end .js file(s)
    # 8) tls/ssl files
  fi
}
  
# c. main function to execute other function(s) sequentially
main () {
  create_dir_and_install_missing_packages
  install_configure_nodejs_web_server
}

# invoke main
main
