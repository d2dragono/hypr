#!/bin/bash
# Required packages for my hyprland installation
sudo pacman -S --needed alsa-firmware alsa-utils arandr bluez bluez-utils brightnessctl dunst grim slurp hyprland hyprlock hypridle hyprpicker kitty kooha libnewt mutter nm-connection-editor pavucontrol python-mako qt6-wayland qt5-wayland sof-firmware swappy swww waybar wayland wl-clipboard wpa_supplicant wofi xdg-desktop-portal-hyprland xdg-desktop-portal-gtk zenity python-pywal gdm nautilus bc dialog figlet libnewt nm-connection-editor os-prober pipewire pipewire-alsa pipewire-audio pipewire-pulse pipewire-session-manager qt6-wayland sbctl nerd-fonts ttf-jetbrains-mono tlp

# We use gdm in the current version
systemctl enable gdm

# Power management
systemctl enable tlp

# yay packages
yay -S wlogout
