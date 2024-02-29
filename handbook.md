# Installation of Arch with Sway, Zen kernel and other nice things :]

## Arch install

## Sway

## Login Manager and setting environment variables

I use greetd as login manager and tuigreet as greeter.

### Installation:

```
$ sudo pacman -s greetd greetd-tuigreet
```

### Configuration:

Enable `greetd.service`

```
$ systemctl enable greetd.service
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
$ chmod +x sway-run
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
$ pacman -S noto-fonts-cjk
```

### Terminal font:

For terminal one I really love Iosevka Nerd Mono:

```
$ pacman -S ttf-iosevkaterm-nerd
```

Set font in your terminal, in my case it is Alacritty.

This command can help your with search of correct name of font family:

```
$ fc-list | grep Iosevka
```

### Sources:

* [Arch Wiki: Fonts](https://wiki.archlinux.org/title/fonts)
* [Arch Wiki: Localization](https://wiki.archlinux.org/title/Localization)

## Uniform look of application

First of all, you need to understand that applications use various GUI libs, like Qt, GTK or even Electron-based.

It means that if you want a really uniform look of your environment you need to choose between Qt and GTK. I will choose Qt.

### Themes:

Install qt5ct and Kvantum Manager:

```
$ pacman -S qt5ct qt6ct kvantum
```

or

```
$ paru -S qt5ct-kde
```

Kvantum Manager already have some themes, I prefer Arc Dark.



Install breeze theme and icons:

```
$ pacman -S breeze breeze-icons breeze-gtk
```

## Shell Set-up

I prefer to use Zsh, so here will be a how-to for this command shell.

### Installation:

Install Zsh and some plugins:

```
$ pacman -S zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting
```

Change your shell to Zsh:

```
$ chsh -s /usr/bin/zsh
```

After that re-log into your session, you will see new-user screen, folow the instructions.

Open .zshrc file and put this lines to the bottom to turn on plugins:

```
# Autosuggestions plugin
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
```

```
# Syntax highlighting plugin
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
```

Restart Zsh, e. g. close and open new terminal instance

### Zsh theme

I like powerlevel10k theme, but you, ofcourse, can choose any.

Clone git repo:

```
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```

Put this line on the bottom of .zshrc file:

```
source ~/powerlevel10k/powerlevel10k.zsh-theme
```
