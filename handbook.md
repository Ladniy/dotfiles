# Installation of Arch with Sway and other nice things :]

> [!NOTE]
> Hash symbol means sudo:
> ```
> # echo 'example'
> ```
> And dollar symbol means normal user:
> ```
> $ echo 'example'
> ```

## Sway

```
# pacman -Sy sway
```

## Login Manager and setting environment variables

### Installation:

```
# pacman -Sy greetd greetd-tuigreet
```

### Configuration:

Enable `greetd.service`

```
# systemctl enable greetd.service
```

Edit configuration file `/etc/greetd/config.toml`:

```
[terminal]
vt = 1

[default_session]
command = "tuigreet --cmd sway-run"
user = "greeter"
```

Create `/usr/local/bin/sway-run` file:

```
#!/bin/sh

# Session
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway

# Toolkit Backend Vars
export GDK_BACKEND=wayland
export QT_QPA_PLATFORM="wayland;xcb"

# Qt Vars
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_QPA_PLATFORMTHEME=qt5ct

# Force Firefox to use wayland
export MOZ_ENABLE_WAYLAND=1

exec systemd-cat --identifier=sway sway $@
```

And made it executable:

```
# chmod +x sway-run
```

> [!NOTE]
> Custom run file for sway allow you to set environment variables

### Sources:

* [Arch Wiki: greetd](https://wiki.archlinux.org/title/Greetd)
* [Sourcehut: greetd](https://man.sr.ht/~kennylevinsen/greetd/#how-to-set-xdg_session_typewayland)
* [GitHub: sway](https://github.com/swaywm/sway/wiki/Setting-environmental-variables)

## Fonts

Default arch installation have a lack of fonts for asian languages.

I preffer Google Noto fonts to close this lack:

```
# pacman -Sy noto-fonts-cjk
```

### Terminal font:

For terminal one I really love Iosevka Nerd Mono:

```
# pacman -Sy ttf-iosevkaterm-nerd
```

Set font in your terminal, in my case it is Alacritty and Kitty.

This command can help your with search of correct name of font family:

```
$ fc-list | grep Iosevka
```

### Sources:

* [Arch Wiki: Fonts](https://wiki.archlinux.org/title/fonts)
* [Arch Wiki: Localization](https://wiki.archlinux.org/title/Localization)

## Appearance:

Install qt5ct, qt6ct and Kvantum Manager:

```
# pacman -Sy qt5ct qt6ct kvantum
```

Kvantum Manager already have some themes, I prefer Arc Dark.

Install Arc Solid theme for GTK apps and Papirus icons:

```
# pacman -Sy arc-solid-gtk-theme papirus-icon-theme
```

Set Arc theme in Kvantum, then set Kvantum theme, fonts and icons in qt5ct and qt6ct.

## Shell Set-up

### Installation:

Install Zsh and some plugins:

```
# pacman -Sy zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting
```

Change your shell to Zsh:

```
$ chsh -s /usr/bin/zsh
```

### Zsh theme:

Clone git repo:

```
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/Git/powerlevel10k
```
