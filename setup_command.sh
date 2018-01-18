#! /bin/bash

if [ $USER = "root" ]
then
echo can not excute as root
exit
fi

if [ -z "$*" ]
then
		cat << EOF
+--------------------------------------------------------------
options are:
a: all, recomand use -d:dmefault
d: default = basic + vim + zsh + tmux 
b: basic
v: vim support
s: add ss and tsock support
h: host support
z: zsh and oh my zsh support
# put zsh at end, cause the sh -c will end this script
t: tmux
p: python and pip app(bypy markdown) support
m: misc support // all others
+--------------------------------------------------------------+
EOF
exit
fi

echo "$*"

# todo add args == 0 to print help

while getopts "adbvsthzm" optname
  do
    case "$optname" in
      "h")
		cat << EOF
+--------------------------------------------------------------
options are:
a: all, recomand use -d:dmefault
d: default = basic + vim + zsh + tmux 
b: basic
v: vim support
s: samba support
f: fq // add ss and tsock support
#h: host support  // removed
z: zsh and oh my zsh support
t: tmux
# tmux plugins manager(tpm) need to be placed under "run '~/.tmux/plugins/tpm/tpm'"
# and then [prefix + I] to install all plugins in .tmux.conf
p: python and pip app(bypy markdown) support
m: misc support // all others
+--------------------------------------------------------------+
EOF
		exit
        ;;
      "a")
		ALL=1
        ;;
      "d")
		DEFAULT=1
		BASIC=1
        VIM_SPF13_SUPPORT=1
		ZSH_OH_SUPPORT=1
		TMUX_SUPPORT=1
		SAMBA_SUPPORT=1
        ;;
      "b")
		BASIC=1
        ;;
      "s")
		SAMBA_SUPPORT=1
        ;;
      "f")
		SS_SUPPORT=1
        ;;
      "v")
                VIM_SPF13_SUPPORT=1
        ;;
      "h")
		#HOST_SUPPORT=1
        ;;
      "z")
		ZSH_OH_SUPPORT=1
        ;;
      "t")
		TMUX_SUPPORT=1
        ;;
      "p")
		PYTHON_APP_SUPPORT=1
        ;;
      "m")
		MISC_SUPPORT=1
        ;;
      "?")
        echo "Unknown option $OPTARG"
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        ;;
      *)
      # Should not occur
        echo "Unknown error while processing options"
        ;;
    esac
  done


if [ -n "$BASIC$ALL" ]
then
# update sources.list
if [ -e ./sources.list ]
then
sudo mv /etc/apt/sources.list /etc/apt/sources.list.backup
sudo cp ./sources.list /etc/apt/sources.list
else
echo ===== source list not update =====
echo ===== source list not update =====
echo ===== source list not update =====
sleep 5
fi


# need to use sudo 
sudo apt-get update

# fix update error in U16
sudo apt-get purge libappstream3

sudo apt-get update 

sudo apt-get install -y openssh-server
mkdir ~/workspace
sudo apt-get install -y vim-nox
sudo apt-get install -y adb
sudo apt-get install -y curl
sudo apt-get install -y repo
sudo apt-get install -y git
sudo apt-get install -y gnome-tweak-tool
sudo apt-get install -y clang-format
sudo apt-get install -y indent
sudo apt-get install -y minicom 
sudo apt-get install -y tree
sudo apt-get install -y uget
sudo apt-get install -y synergy
sudo apt-get install -y python-dev python3-dev
sudo apt-get install -y python2.7-dev
sudo apt-get install -y openjdk-8-jdk
sudo apt-get install -y openjdk-9-jdk
fi

if [ -n "$SS_SUPPORT$ALL" ]
then
sudo apt-get install -y shadowsocks
sudo add-apt-repository -y ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install -y shadowsocks-qt5
sudo apt-get install -y tsocks

# move the sslocal@myserver.service to /lib/systemd/system and link to etc/systemd/system/multi-user.target.wants/
sudo ln -sf /lib/systemd/system/sslocal@myserver.service /etc/systemd/system/multi-user.target.wants/sslocal@myserver.service
#sudo rm /etc/tsocks.conf
#sudo ln -sf ~/workspace1/github/config/tsocks.conf /etc/tsocks.conf
fi

if [ -n "$HOST_SUPPORT$ALL" ]
then
# try to fetch the github
mkdir -p ~/workspace/github/
git clone https://github.com/googlehosts/hosts.git ~/workspace/github/hosts
sudo cp /etc/hosts  /etc/hosts.default
sudo cp ~/workspace/github/hosts/hosts-files/hosts /etc/hosts
#hosts can not use ln
#sudo rm /etc/hosts
#sudo ln -sf ~/workspace1/github/hosts/hosts /etc/hosts
fi


if [ -n "$BASIC$ALL" ]
then
# git clone 
git clone https://github.com/bitliuxm/bash_script.git ~/workspace/github/bash_script
git clone https://github.com/bitliuxm/config.git ~/workspace/github/config
git clone https://github.com/powerline/fonts.git ~/workspace/github/fonts
# can not use git protocol until the ssh_pub is set in github.com
#git clone git@github.com:bitliuxm/bash_script.git ~/workspace/github/bash_script
#git clone git@github.com:bitliuxm/config.git ~/workspace/github/config
#git clone git@github.com:powerline/fonts.git ~/workspace/github/fonts

cd ~/.ssh
key-keygen
touch authorized_keys
touch config
cd - 

# change to git protocol
sed -i 's_https://github.com/bitliuxm/config.git_git@github.com:bitliuxm/config.git_g' ~/workspace/github/config/.git/config
sed -i 's_https://github.com/bitliuxm/bash\_script.git_git@github.com:bitliuxm/bash\_script.git_g' ~/workspace/github/bash_script/.git/config

# make ln for all script
mkdir -p ~/bin
cd ~/workspace/github/bash_script
~/workspace/github/bash_script/make_ln_all ~/bin
cd -

ln -sf ~/workspace/github/config/gitconfig ~/.gitconfig
ln -sf ~/workspace/github/config/bashrc ~/.bashrc
ln -sf ~/workspace/github/config/clang-format-config  ~/.clang-format

fi

if [ -n "$TMUX_SUPPORT$ALL" ]
then
sudo apt-get install -y tmux
ln -sf ~/workspace/github/config/.tmux.conf ~/.tmux.conf

# for plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect

# tmux plugins manager(tpm) need to be placed under "run '~/.tmux/plugins/tpm/tpm'"
tmux source ~/.tmux.conf
# and then [prefix + I] to install all plugins in .tmux.conf
fi

if [ -n "$SAMBA_SUPPORT$ALL" ]
then
sudo apt-get install -y samba --fix-missing
sudo apt-get install -y smbclient
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.default

if [ -e "smb.conf" ]
then
# for user != bit , need a replace
sed -i 's/bit/$USER/g' smb.conf
sudo cp smb.conf /etc/samba/smb.conf
else
echo "smb.conf is not found in current folder"
sleep 5
fi

# need add smb user passwd
sudo smbpasswd -a "$USER"
fi

if [ -n "$VIM_SPF13_SUPPORT$ALL" ]
then
# spf13
# vim spf13 install, should only be excute as user
sudo apt-get install -y ack-grep
sudo apt-get install -y exuberant-ctags
sudo apt-get install -y shellcheck

ln -sf ~/workspace/github/config/.vimrc.bundles.local ~/.vimrc.bundles.local
ln -sf ~/workspace/github/config/vimrc.before.local ~/.vimrc.before.local
ln -sf ~/workspace/github/config/vimrc.local ~/.vimrc.local

# for YCM
sudo apt-get install -y build-essential cmake
sudo apt-get install -y python-dev python3-dev

#vim spf13 install, should only be excute as user
# plugin will be auto installed based on configures
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
# this cmd need manually confirm
vim -c BundleUpdate -c quitall

# if YCM not work
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

fi

if [ -n "$MISC_SUPPORT$ALL" ]
then

# for bash check
sudo apt-get install shellcheck

# for android build server
sudo apt-get install -y bc bison build-essential curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev

# for audit2allow
sudo apt-get install -y policycoreutils

### cron
# cron can not use ln
#sudo ln -sf   ~/workspace/github/config/crontab_user  /var/spool/cron/crontabs/bit

sudo apt-get install -y openssl
sudo apt-get install -y autoconf
sudo apt-get install -y docker

fi


if [ -n "$PYTHON_APP_SUPPORT$ALL" ]
then

sudo apt-get install -y python-dev python3-dev
sudo apt-get install -y python2.7-dev

#setup python basic
wget http://peak.telecommunity.com/dist/ez_setup.py
sudo python ez_setup.py
sudo easy_install pip

# setup baidupan
sudo pip install requests
sudo pip install bypy

### python markdown setup
#wget http://peak.telecommunity.com/dist/ez_setup.py
#sudo python ez_setup.py
#sudo easy_install pip
#sudo easy_install markdown
#sudo pip install pymdown-extensions
#sudo pip install PyYAML 
#sudo pip install Pygments
fi

# put zsh at end, cause the sh -c will end this script
if [ -n "$ZSH_OH_SUPPORT$ALL" ]
then
sudo apt-get install -y zsh
# should not add sudo for chsh
chsh -s /bin/zsh

ln -sf ~/workspace/github/config/zshrc ~/.zshrc

# oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
## shell will end here
fi

