#!/bin/bash
#set -e

#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

echo
tput setaf 2
echo "################################################################"
echo "################### am Software to install"
echo "################################################################"
tput sgr0
echo

if grep -q am-repo /etc/pacman.conf; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################ am repos are already in /etc/pacman.conf"
  echo "################################################################"
  tput sgr0
  echo
  else
  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Getting  repos for am"
  echo "################################################################"
  tput sgr0
  echo
  sh am/get-am-repos.sh
  sudo pacman -Sy
  sudo pacman -S fakeroot
fi

# install yay if not already installed
if ! command -v yay > /dev/null; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi

echo
tput setaf 2
echo "################################################################"
echo "################### Install Software"
echo "################################################################"
tput sgr0
echo


PKGS=(
'archiso'  
'appstream'
'ayu-theme'
'adobe-source-sans-fonts'
'aic94xx-firmware'
'arandr'
'alacritty'
'asciinema'
'avahi'
'baobab'
'bash-completion'
'bat'
'bibata-cursor-theme-bin'
'brave-bin'
'catfish'
'conky-lua-archers-git'
'catppuccin-gtk-theme'
'cpuid'
'curl'
'cava'
'discord'
'dmenu'
'downgrade'
'duf'
'evince'
'expac'
'feh'
'file-roller'
'firefox'
'geany'
'geany-plugins'
'am-geany-config-git'
'font-manager'
'galculator'
'gimp'
'git'
'gitahead-bin'
'gitfind'
'gparted'
'grub-customizer'
'gtop'
'gvfs-smb'
'gpick'
'gnome-disk-utility'
'hardinfo-gtk3'
'humanity-icon-theme'
'hddtemp'
'htop'
'hw-probe'
'inkscape'
'imagewriter'
'kvantum'
'linux-firmware-qlogic'
'logrotate'
'lolcat'
'lshw'
'man-db'
'man-pages'
'meld'
'mintstick-git'
'most'
'neofetch'
'network-manager-applet'
'networkmanager-openvpn'
'paru-bin'
'pcmanfm-gtk3'
'pragha'
'pavucontrol'
'playerctl'
'plank'
'polkit-gnome'
'python-pywal'
'pv'
'qbittorrent'
'rate mirrors-bin'
'ripgrep'
'rsync'
'scrot'
'simplescreenrecorder'
'sparklines-git'
'speedtest-cli-git'
'squashfs-tools'
'sublime-text-4'
'system-config-printer'
'telegram-desktop'
'time'
'the_platium_sercher-bin'
'the_silver_searcher'
'tree'
'ttf-bitstream-vera'
'ttf-dejavu'
'ttf-droid'
'ttf-hack'
'ttf-inconsolata'
'ttf-liberation'
'ttf-roboto'
'ttf-roboto-mono'
'ttf-ubuntu-font-family'
'spotrec'
'vlc'
'wd719x-firmware'
'wgwt'
'xdg-user-dirs'
'xorg-kill'
'yay-bin'
'zsh'
'zsh-completions'
'zsh-syntax-highlighting'
'cups'
'cups-pdf'
'ghostscript'
'gsfonts'
'gutenprint'
'gtk3-print-backends'
'libcups'
'system-config-printer'
'sane'
'simple-scan'
'gzip'
'p7zip'
'unace'
'unrar'
'unzip'
'visual-studio-code-bin'
'pycharm-community-edition'
'menulibre'
'mugshot'
'xfce4-genmon-plugin'
'xfce4-mpc-plugin'
'etcher-bin'
#'proton-ge-custom-bin'
'skypeforlinux-stable-bin'
#'goverlay-bin'
'halo-icons-git'
#'protonup-git'
#'proton-community-updater'
'libpamac-aur'
'pamac-aur'
'amos-alacritty-config-git'
'amos-xfce4-git'
'amos-xfce-styles'
#'amos-xfce-styles-notebook'
'amos-pywal-conky-git'
'amos-sweet-icons-git'
'amos-dconf-git'
'am-kdocker-config-git'
'amos-icon-pack-git'
'amos-plank-themes-git'
'amos-config-git'
'amos-gtk-themes-git'
'amos-neofetch-config-git'
'amos-bin-git'
'amos-glava-config-git'
'amos-root-git'
#'amos-eos-apollo-wallpapers-git'
'amos-pixmaps-git'
'amos-panel-profiles-git'
'xfce4-panel-profiles'
'catppuccin-cursors-git'
'zsh-theme-powerlevel10k-git'
'ttf-meslo-nerd-font-powerlevel10k'
'bibata-cursor-theme'
'bibata-extra-cursor-theme'
'bibata-rainbow-cursor-theme'
'kdocker'
'kshutdown'
'win10-icons-git'
'win11-icons-git'
'dracular-icons-git'
'patool'
#'bottles'
'xscreensaver'
'imagewriter'
#'lib32-nvidia-utils'
'tela-circle-icon-theme-git'
'linux-zen'
'linux-zen-headers'
#'gamemode'
#'lib32-gamemode'
#'samsung-unified-driver-common'
#'samsung-unified-driver-printer'
#'samsung-unified-driver-scanner'
'spotrec'
'steam'
'steam-fonts'
'steam-tweaks'
'steam-native-runtime'
#'smplayer'
#'smplayer-skins'
#'smplayer-themes'
'thunderbird'
'guvcview'
'soundconverter'
'yaru-colors-gtk-theme'
'yaru-colors-icon-theme'
'yaru-colors-wallpapers'
'yaru-gtk-theme'
'yaru-icon-theme'
'Fluent-icon-pack-git'
'fluent-themes-pack-git'
'spotify'
'spotify-adblock-git'
'ttf-wps-fonts'
'wps-office'
'wps-office-mime'

  )

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    yay -S "$PKG" --noconfirm --needed
done

sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service

echo
tput setaf 2
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
