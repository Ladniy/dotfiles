# Arch Linux with Hyprland and Waybar Setup

## Waybar install
Waybar-hyprland package needs GCC-12 until it will be updated for GCC-13

```
  yay -S gcc-12
```

```
  export CC=gcc-12 CXX=g++-12
```

```
  yay -S waybar-hyprland
```


## Bluetooth setup

Install packages

```
  yay -S bluez bluez-utils blueberry
```

Start bluetooth services

```
  systemctl enable bluetooth.service
```

```
  systemctl start bluetooth.service
```
## One half theme for everything

### Kitty:

```
  git clone https://github.com/sonph/onehalf.git
```

```
  cp onehalf/kitty/onehalf-dark.conf ~/.config/kitty/
```

In kitty.conf file:

```
  include onehalf-dark.conf
```
### Helix:

In config.toml file:

```
  theme = "onedark"
```

## Screenshots

Dependencies:

```
  yay -S slurp grim
```

```
  git clone https://github.com/hyprwm/contrib
```

```
  cd contrib/grimblast/
```

```
  make install
```

In hyprland config file:

```
  bind = $mainMod, S, exec, grimblast --notify copy area
```