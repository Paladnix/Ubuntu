#!/bin/bash

# update the source list
sudo cp sources.list /etc/apt/sources.list
sudo apt update

# install normal software
sudo apt -y install git fish g++ curl xclip python-pip fcitx-googlepinyin ack-grep tree
chsh -s /usr/bin/fish

# install google-chrome-stable
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt -f -y install 
sudo dpkg -i google-chrome-stable_current_amd64.deb

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
mkdir -r  ~/.local/share/fonts
cp ./fonts/* ~/.local/share/fonts/
sudo chown -R "$USER":"$USER" ~/.local

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
# sudo apt -y install texlive-latex-base  texlive-latex-extra latex-cjk-all latex2html

# copy bin of myself
cp -r ./bin ~/
sudo chown -R "$USER":"$USER" ~/bin


# RSA-key
# ssh-keygen -t rsa -C 'paladnix@outlook.com'

# install mysql
#sudo apt install mysql-server
#sudo apt install mysql-client

# install thunderbird & task
# sudo add-apt-repository -y ppa:mozillateam/thunderbird-next
# sudo apt update
# sudo apt install -y task thunderbird

# sudo npm install hexo-cli -g
# npm install hexo-deployer-git --save


