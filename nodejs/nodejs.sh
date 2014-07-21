rm -rf ~/.nvm
NVM_DIR=~/.nvm curl -L https://raw.github.com/creationix/nvm/master/install.sh | bash
echo "export NVM_DIR=~/.nvm; source ~/.nvm/nvm.sh" >> ~/.bashrc
source ~/.bashrc
nvm install 0.10
nvm alias default 0.10
npm install -g bower grunt node-gyp