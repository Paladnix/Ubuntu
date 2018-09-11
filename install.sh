#!/bin/bash

# update the source list
sudo cp sources.list /etc/apt/sources.list
sudo apt update

# install normal software
sudo apt -y install git fish g++ curl xclip python-pip fcitx-googlepinyin ack-grep tree python3 python3-pip taskwarrior screen
chsh -s /usr/bin/fish
sudo pip3 install bs4
git clone --depth=1 https://github.com/chestnutheng/wudao-dict && cd ./wudao-dict/wudao-dict && sudo sh setup.sh && cd ../../

# install google-chrome-stable
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt -f -y install 

# install arc-theme
sudo apt -y install autoconf automake pkg-config libgtk-3-dev gnome-themes-standard gtk2-engines-murrine
git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme
./autogen.sh --prefix=/usr
sudo make install
cd ../

# install numix
sudo add-apt-repository -y ppa:numix/ppa
sudo apt update
sudo apt -y install numix-gtk-theme numix-icon-theme-circle

# install fonts
mkdir  ~/.local/share/fonts
cp ./fonts/* ~/.local/share/fonts/
sudo chown -R "$USER":"$USER" ~/.local
cd ~/.local/share/fonts/
sudo mkfontscale
sudo mkfontdir
sudo fc-cache -fv
cd ~/Ubuntu

# install powerline
sudo pip install powerline-status

# setting bash to powerline
sudo echo 'powerline-daemon -q' >> /etc/profile
sudo echo 'POWERLINE_BASH_CONTINUATION=1' >> /etc/profile
sudo echo 'POWERLINE_BASH_SELECT=1' >> /etc/profile
sudo echo '. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh' >> /etc/profile

# setting fish to powerline
touch ~/.config/fish/config.fish
echo 'set fish_function_path $fish_function_path "/usr/local/lib/python2.7/dist-packages/powerline/bindings/fish" ' > ~/.config/fish/config.fish
echo 'powerline-setup' >> ~/.config/fish/config.fish
sudo chown -R "$USER":"$USER" ~/.config

# install vimplus
git clone https://github.com/chxuan/vimplus.git
cd ./vimplus
sudo ./install.sh
cd ../

# install latex
 sudo apt -y install texlive-latex-base  texlive-latex-extra latex-cjk-all latex2html

# copy bin of myself
cp -r ./bin ~/
sudo chown -R "$USER":"$USER" ~/bin


# RSA-key
ssh-keygen -t rsa -C 'paladnix@outlook.com'
git config --global user.email "paladnix@outlook.com"
git config --global user.name "paladnix"

# install thunderbird
# sudo add-apt-repository -y ppa:mozillateam/thunderbird-next
# sudo apt update
# sudo apt install -y thunderbird

# install nodejs on ubuntu -version 8.x
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn

# install hexo blog system
sudo npm install hexo-cli -g
sudo chown -R $USER:$(id -gn $USER) /home/paladnix/.config
npm install hexo-deployer-git --save

# install shadowsocks
sudo pip install shadowsocks

# start the shadowsocks:
# sslocal -c shadowsocks.json
# start the google-chrome with proxy: 
# google-chrome --proxy-server=socks5://127.0.0.1:1080

# install apache2 & php7
sudo apt install -y apache2  apache2-doc
sudo apt install -y php7.0 libapache2-mod-php7.0


# install mysql & php support
sudo apt install -y mysql-server mysql-client php7.0-mysql

# JDK
tar -zxvf ./jdk-8u171-linux-x64.tar.gz
sudo mkdir /opt/java/
sudo mv ./jdk1.8.0_171 /opt/java/jdk1.8

echo "export JAVA_HOME=/opt/java/jdk1.8" >> /etc/profile
source /etc/profile
echo "export JRE_HOME=${JAVA_HOME}/jre" >> /etc/profile
source /etc/profile
echo "export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib" >> /etc/profile
echo "export PATH=${JAVA_HOME}/bin:$PATH" >> /etc/profile
source /etc/profile

# redis
wget http://download.redis.io/releases/redis-4.0.10.tar.gz
tar -zxvf redis-4.0.10.tar.gz
cd redis-4.0.10/
sudo make 
sudo make install

# 修改daemonize no 为 yes : 后台运行
# 修改requirepass : 添加密码

