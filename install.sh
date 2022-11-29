#!/bin/bash

# Install i3
dnf -y install Xorg xinit i3-gaps
cp /etc/X11/xinit/xinitrc ~/.xinitrc

# Install RPM Fusion
dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf -y update

# Install packages
dnf -y install git zsh vim arandr lxappearance alacritty polybar j4-dmenu-desktop light picom playerctl feh bat httpie exa the_silver_searcher papirus-icon-theme flameshot ffmpeg-libs util-linux-user

# Install fonts
http -d https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
http -d https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip

mkdir Nerd\ Fonts
unzip FiraCode.zip -d Nerd\ Fonts
rm Nerd\ Fonts/readme.md
unzip Hack.zip -d Nerd\ Fonts

mv Nerd\ Fonts /usr/share/fonts

rm FiraCode.zip
rm Hack.zip

fc-cache -fv

# Dotfiles
# git clone https://github.com/LilleAila/i3-config.git
mkdir -p $HOME/Pictures
mkdir -p $HOME/.config
# cd i3-config
cp background.jpg $HOME/Pictures/
cp config/* $HOME/.config/*

# Betterlockscreen
http -d https://github.com/Raymo111/i3lock-color/releases/latest/download/i3lock
chmod +x i3lock
mv i3lock /usr/local/bin

http -d -o betterlockscreen https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/next/betterlockscreen
chmod +x betterlockscreen
mv betterlockscreen /usr/local/bin

dnf -y copr enable aflyhorse/libjpeg
dnf -y install libjpeg8 xrdb xset xdpyinfo
betterlockscreen -u ~/Pictures/background.jpg

# Info
cat << EOF
Polybar config:
Edit ~/.config/polybar/config.ini
[bar/DP-2] is the secondary bar
[bar/HDMI-0] is the main bar
Change [bar/HDMI-0] to [bar/Virtual-1] for virtual machines

Displays:
Save arandr config in ~/.screenlayout/displays.sh
EOF

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"