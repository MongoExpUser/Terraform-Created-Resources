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
#  4) Start mongodb without credentials (OPTIONAL)  - just for checking valid installation          #
#     - NOT recommended for production deployment                                                   #
#...................................................................................................#


#!/bin/bash

# a. define all common variable(s)
enable_web_server=true
base_dir="base"
server_dir="server"
client_dir="client"
enable_mongodb_server=true

# b. create directory & missing packages function
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

# c. create node.js web server function
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
        
    # install express.js (the server framework) and other node.js packages
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

# d.
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
    
    # create mongod.log file
    sudo echo '# mongod.log file' > /var/log/mongodb/mongod.log
    
    # enable mongodb.service
    sudo systemctl enable mongodb.service
    sudo systemctl enable mongod.service
        
    # re-load
    sudo systemctl daemon-reload
        
    # start mongodb: OPTIONAL
    # option 1: uncomment the 5th line after this line, to start mongod automatically when instance is launched
    #         : this optiomn starts mongodb without credentials (OPTIONAL)  - just for checking valid installation
    #         : NOT recommended for production deployment
    # option 2: issue the command in the next line (on an exitable ubuntu screen prompt) to start mongod, manually
    #         : recommended for production deployment, after seeting up security with user, password and tsl/ssl (if applicable)
    # sudo mongod --quiet --config /etc/mongod.conf
        
    # stop mongodb:
    # to stop mongodb: issue the command below on the shell prompt
    # sudo mongod --quiet --dbpath /var/lib/mongodb --shutdown
  fi
}

# e. main function to execute other function(s) sequentially
main () {
  create_dir_and_install_missing_packages
  install_configure_nodejs_web_server
  install_mongodb_server_and_configure
}

# invoke main
main
