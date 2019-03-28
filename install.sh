#!/bin/bash

####################################
# update the source list
####################################
sudo cp sources.list /etc/apt/sources.list
sudo apt update


####################################
# normal software
####################################
sudo apt -y install \
    git fish g++ curl xclip python-pip \
    fcitx-googlepinyin ack-grep tree \
    python3 python3-pip taskwarrior screen \
    zsh zathura openssh-server

####################################
# fix some bug of pip 
####################################
# BUG No.1
####################################
# if you update pip with command the MESSAGE show you.
# there will be an error :
########## Error #######
# Traceback (most recent call last):
#   File "/usr/bin/pip", line 9, in <module>
#     from pip import main
# ImportError: cannot import name main
########################
# then you need change `/usr/bin/pip` to :
########################
# from pip import __main__
#   if __name__ == '__main__':
#       sys.exit(__main__._main())
########################
# BUG No.2
###################################
# if there is an error: Old version of cryptography ([1, 2, 3]) may cause slowdown.
# then 
# sudo python -m easy_install --upgrade pyOpenSSL
# sudo pip install --upgrade cryptography
###################################

####################################
# oh my zsh
####################################
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s /usr/bin/zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


####################################
# auto run
####################################
# same as ./bin/sslocal.sh
sudo cp ./bin/sslocal.sh /etc/init.d/
sudo chmod 755 /etc/init.d/sslocal.sh
cd /etc/init.d/
sudo update-rc.d sslocal.sh defaults 95


####################################
# Wudao dict
####################################
sudo pip3 install bs4
git clone --depth=1 https://github.com/chestnutheng/wudao-dict && cd ./wudao-dict/wudao-dict && sudo sh setup.sh && cd ../../

####################################
# install google-chrome-stable
####################################
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
# sudo apt -f -y install 

####################################
# install Mac-OS-icon & theme & fonts
####################################
cp -r ./src/fonts ~/.local/share/
cp -r ./src/themes ~/.local/share/
cp -r ./src/icons ~/.local/share/






####################################
# install arc-theme
####################################
#sudo apt -y install autoconf automake pkg-config libgtk-3-dev gnome-themes-standard gtk2-engines-murrine
#git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme
#./autogen.sh --prefix=/usr
#sudo make install
#cd ../

####################################
# install numix
####################################
#sudo add-apt-repository -y ppa:numix/ppa
#sudo apt update
#sudo apt -y install numix-gtk-theme numix-icon-theme-circle

####################################
# install fonts
####################################
#mkdir  ~/.local/share/fonts
#cp ./fonts/* ~/.local/share/fonts/
#sudo chown -R "$USER":"$USER" ~/.local
#cd ~/.local/share/fonts/
#sudo mkfontscale
#sudo mkfontdir
#sudo fc-cache -fv
#cd ~/Ubuntu

####################################
# install powerline
####################################
#sudo pip install powerline-status

####################################
# setting bash to powerline
####################################
#sudo echo 'powerline-daemon -q' >> /etc/profile
#sudo echo 'POWERLINE_BASH_CONTINUATION=1' >> /etc/profile
#sudo echo 'POWERLINE_BASH_SELECT=1' >> /etc/profile
#sudo echo '. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh' >> /etc/profile

####################################
# setting fish to powerline
####################################
#touch ~/.config/fish/config.fish
#echo 'set fish_function_path $fish_function_path "/usr/local/lib/python2.7/dist-packages/powerline/bindings/fish" ' > ~/.config/fish/config.fish
#echo 'powerline-setup' >> ~/.config/fish/config.fish
#sudo chown -R "$USER":"$USER" ~/.config

####################################
# install vimplus
####################################
git clone https://github.com/chxuan/vimplus.git
cd ./vimplus
sudo ./install.sh
cd ../

####################################
# install latex
####################################
sudo apt -y install texlive-latex-base  texlive-latex-extra latex-cjk-all latex2html

####################################
# copy bin of myself
####################################
cp -r ./bin ~/
sudo chown -R "$USER":"$USER" ~/bin


####################################
# RSA-key
####################################
#ssh-keygen -t rsa -C 'paladnix@outlook.com'
#git config --global user.email "paladnix@outlook.com"
#git config --global user.name "paladnix"

# install thunderbird
# sudo add-apt-repository -y ppa:mozillateam/thunderbird-next
# sudo apt update
# sudo apt install -y thunderbird


####################################
# install nodejs on ubuntu -version 8.x
####################################
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt install -y nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install -y yarn

####################################
# install hexo blog system
####################################
#sudo npm install hexo-cli -g
#sudo chown -R $USER:$(id -gn $USER) /home/paladnix/.config
#npm install hexo-deployer-git --save

####################################
# install shadowsocks
####################################
sudo pip install shadowsocks

# start the shadowsocks:
# sslocal -c shadowsocks.json
# start the google-chrome with proxy: 
# google-chrome --proxy-server=socks5://127.0.0.1:1080

####################################
# install apache2 & php7
####################################
sudo apt install -y apache2  apache2-doc
sudo apt install -y php7.0 libapache2-mod-php7.0


####################################
# install mysql & php support
####################################
sudo apt install -y mysql-server mysql-client php7.0-mysql

####################################
# JDK
####################################
#tar -zxvf ./jdk-8u171-linux-x64.tar.gz
#sudo mkdir /opt/java/
#sudo mv ./jdk1.8.0_171 /opt/java/jdk1.8
#echo "export JAVA_HOME=/opt/java/jdk1.8" >> /etc/profile
#source /etc/profile
#echo "export JRE_HOME=${JAVA_HOME}/jre" >> /etc/profile
#source /etc/profile
#echo "export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib" >> /etc/profile
#echo "export PATH=${JAVA_HOME}/bin:$PATH" >> /etc/profile
#source /etc/profile

####################################
# redis
####################################
#wget http://download.redis.io/releases/redis-4.0.10.tar.gz
#tar -zxvf redis-4.0.10.tar.gz
#cd redis-4.0.10/
#sudo make 
#sudo make install

# 修改daemonize no 为 yes : 后台运行
# 修改requirepass : 添加密码


####################################
# pyspider
####################################
#sudo apt-get install python python-dev python-distribute python-pip libcurl4-openssl-dev libxml2-dev libxslt1-dev python-lxml
#sudo apt-get install libssl-dev libffi-dev build-essential
#sudo apt install phantomjs
#sudo apt install pyspider



