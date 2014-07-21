#!/usr/bin/env bash
rm -rf ~/.nvm

NVM_DIR=~/.nvm curl -L https://raw.github.com/creationix/nvm/master/install.sh | bash

if grep NVM_DIR ~/.bashrc
then
	echo "NVM_DIR already set."
else
	printf "export NVM_DIR=~/.nvm;\n. ~/.nvm/nvm.sh" >> ~/.bashrc
fi

. ~/.nvm/nvm.sh

nvm install 0.10
nvm alias default 0.10
npm install -g bower grunt node-gyp