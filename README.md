## Install `i3` and `Xorg`

```bash
sudo dnf install Xorg xinit i3-gaps
cp /etc/X11/xinit/xinitrc ~/.xinitrc
# echo >> “exec i3” ~/.xinitrc

startx $(which i3) # Start i3
```

## Install `RPM Fusion`

```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update
```

## Install packages

```bash
sudo dnf install git zsh vim arandr lxappearance alacritty polybar
sudo dnf install j4-dmenu-desktop light picom playerctl feh bat httpie exa the_silver_searcher papirus-icon-theme flameshot ffmpeg-libs util-linux-user
```

## Install nerd fonts

```bash
http -d https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
http -d https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip

mkdir Nerd\ Fonts
unzip FiraCode.zip -d Nerd\ Fonts
unzip Hack.zip -d Nerd\ Fonts

sudo mv Nerd\ Fonts /usr/share/fonts

rm FiraCode.zip
rm Hack.zip
```

## Install `oh my zsh`

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Set default shell

```bash
#echo "export SHELL=$(which zsh)" >> ~/.profile
#echo '[ -z "$ZS_VERSION" ] && exec $(which zsh) -l' >> ~/.profile
which zsh # Find path to zsh
chsh # Zsh path
sudo chsh # Zsh path
```

## Install betterlockscreen

```bash
http -d https://github.com/Raymo111/i3lock-color/releases/latest/download/i3lock
chmod +x i3lock
sudo mv i3lock /usr/local/bin

http -d -o betterlockscreen https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/next/betterlockscreen
chmod +x betterlockscreen
sudo mv betterlockscreen /usr/local/bin

sudo dnf copr enable aflyhorse/libjpeg
sudo dnf install libjpeg8 xrdb xset xdpyinfo
betterlockscreen -u ~/Pictures/background.jpg
```

## Dot-Files

```bash
git clone https://github.com/LilleAila/i3-config.git # This repo
mkdir -p ~/Pictures
cd i3-config
cp background.jpg ~/Pictures/
cp config/* ~/.config/*
```
