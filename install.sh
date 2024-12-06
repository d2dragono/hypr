#!/bin/bash
# Going in user home folder
cd $HOME

# Downloading required packages for yay installation
sudo pacman -Syu
sudo pacman -S git base-devel --needed

# Is yay installed ?
if ! yay --version; then
    git clone https://aur.archlinux.org/yay.git
    makepkg -si yay
    rm -rf yay
fi

# Required packages for my hyprland installation
sudo pacman -S --needed alsa-firmware alsa-utils arandr bluez bluez-utils brightnessctl dunst grim slurp hyprland hyprlock hypridle hyprpicker kitty kooha libnewt mutter nm-connection-editor pavucontrol python-mako qt6-wayland qt5-wayland sof-firmware swappy swww waybar wayland wl-clipboard wpa_supplicant wofi xorg-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk zenity python-pywal gdm nautilus bc dialog figlet libnewt nm-connection-editor os-prober pipewire pipewire-alsa pipewire-audio pipewire-pulse pipewire-session-manager qt6-wayland sbctl nerd-fonts ttf-jetbrains-mono tlp

# We use gdm in the current version
systemctl enable gdm

# Power management
systemctl enable tlp

# yay packages
yay -S wlogout

# Hyprland need a .config folder. it must exist because we installed packages that set configs in it but just in case we double check
if ! cd .config; then
    mkdir .config
    cd .config
fi

# Downloading hypr config
rm -rf hypr
git clone https://github.com/d2dragono/hypr.git