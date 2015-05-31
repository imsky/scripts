#!/usr/bin/env bash

NVM_DIR=${1:-~/.nvm}

rm -rf $NVM_DIR
NVM_DIR=$NVM_DIR curl -L  https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

if grep NVM_DIR ~/.bashrc
then
 echo "NVM_DIR already set."
else
 printf "export NVM_DIR=$NVM_DIR;\n. $NVM_DIR/nvm.sh" >> ~/.bashrc
fi

. $NVM_DIR/nvm.sh
nvm install 0.12
nvm alias default 0.12
