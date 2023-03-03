# Newton
Simple and efficient Linux Rice on BSPWM with Rose Pine Moon theme.

![1](https://github.com/harishnkr/NewtonRice/blob/main/.github/assets/1.png)
![2](https://github.com/harishnkr/NewtonRice/blob/main/.github/assets/2.png)
![3](https://github.com/harishnkr/NewtonRice/blob/main/.github/assets/3.png)
![4](https://github.com/harishnkr/NewtonRice/blob/main/.github/assets/4.png)
![5](https://github.com/harishnkr/NewtonRice/blob/main/.github/assets/5.png)
![6](https://github.com/harishnkr/NewtonRice/blob/main/.github/assets/6.png)

## Applications

|OS|[Arch](https://archlinux.org/)|
|---|---|
| WM | [BSPWM](https://github.com/baskerville/bspwm) |
|Bar  | [Polybar](https://github.com/polybar/polybar) |
|Terminal|[Kitty](https://github.com/kovidgoyal/kitty) and [URxvt](http://software.schmorp.de/pkg/rxvt-unicode.html)|
|GUI File Manager| [Thunar](https://docs.xfce.org/xfce/thunar/start)|
|Compositor| [Picom](https://github.com/yshui/picom)
|Application Launcher| [Rofi](https://github.com/davatorium/rofi)|
|Hotkey Daemon|[SXHKD](https://github.com/baskerville/sxhkd)|
|Display Manager|[LightDM](https://github.com/canonical/lightdm) ,with [Mini-Greeter](https://github.com/prikhi/lightdm-mini-greeter)|

If you want the configuration files for other console applications that i use, head over to the [.dotfiles](https://github.com/harishnkr/dotfiles) repo. I like to decouple the desktopsetup from the command line applications.

## Installation

### Fonts

The following fonts are utilised:

|Application|Fonts used|
|---|---|
Kitty and URxvt |```Fira Code``` and ```Victor Mono```
Polybar|```Iosevka Nerd Font``` for text, ```Feather``` and ```Material Design Iconic``` fonts for icons.
Rofi| ```Fantasque Sans Mono```

Copy the fonts from the fonts directory, and copy it to ```~/.local/share/fonts``` directory, followed by running ```fc-cache``` on your system.\
You can use your own fonts by editing the respective config files.

### Quick installation tips

For those who know how everything works, you can install majority of the files by: 

* a) Installing the relevant packeges and the respective dependencies, including [GNU Stow](https://www.gnu.org/software/stow/) for sourcing symlinks.
*  b) Cloning the repo into your ```~``` directory, followed by
* c) Using GNU Stow and to create symlinks for each of the packages. For example, to copy the files from ```X``` folder to the home folder, run ```stow X```.
* d) GTK theming must be stowed followed by using [LXAppearance](https://github.com/lxde/lxappearance) to apply it uniformly
* Cursor theme used is [Bibata](https://github.com/ful1e5/Bibata_Cursor) Original Classic variant.

LightDM configuration must be done separately with root privileges.

Check the ```.stow-local-ignore``` file to see what all are ignored.

### Manual Installation and Configuration

#### WM

* Copy the files from the ```X``` Directory into your home directory.
* Make sure you have installed all the relevant Xorg packages as well as BSPWM and SXHKD.
* Copy the config files from the BSPWM folder and add it to ```~/.config/bspwm/``` directory.
* Do the same for  SXHKD by adding the config file to ```~/.config/sxhkd/``` directory
* Install Picom (the original package, not any other forks; since most of the features are now merged with the main fork), copy the config file from the ```Picom``` folder.
#### Polybar

Make sure that these packages are installed along with the Polybar package:
Package|Usage
|---|---|
Rofi|Application Launcher
[Pulseaudio](https://github.com/pulseaudio) and [Pavucontrol](https://freedesktop.org/software/pulseaudio/pavucontrol/)| Volume control
[Mpd](https://www.musicpd.org/)| Music bar
[Yad](https://github.com/v1cont/yad)|Popup calendar and Powermenu

I use [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp) as my MPD client but you can use whatever client you want. Make sure to check out ```[module/music-player]``` section inside the ```modules.ini``` file.\
I also use NetworkManager applet and Blueman-manager applets from the system tray since it is convenient compared to using the repective modules from polybar.\
Theming for the gtk apps(eg: Pavucontrol, Popup Calendar, Powermenu, System Tray applications) used in polybar follows the Rose-Pine-Moon theme. Check out the [Theming](https://github.com/harishnkr/NewtonRice#theming) section for more info.


* Copy the files from the Polybar folder to ```~/.config/polybar/``` directory.
* Copy the config file from Rofi directory if you want to use Rofi
* Make sure that all the scripts inside the ```Polybar``` folder are executable. If it is not, run ```chmod +x <filename>```.
* Various colors are declared in the ```colors.ini``` file but it is sourced from the ```.Xresources``` file so make sure the file is placed in the home directory.


#### Terminal

Install Kitty terminal and/or URxvt. The config file for Kitty is in the ```Kitty``` directory. URxvt gets its configuration directly from the ```.Xresources``` file inside the ```X``` folder. URxvt also uses some perl extensions so check out [this](https://wiki.archlinux.org/title/rxvt-unicode#Perl_extensions) Arch Wiki section for more info.


#### Theming

The primarily used theme is the [Rose-Pine](https://github.com/rose-pine/rose-pine-theme) theme, Moon variant.
Most application themes are directly provided in the configuration files. For GTK applications such as Thunar and Firefox, theming is done by copying the files from the ```gtk``` folder followed by:

* Placing the files in the .config directory in the ```~/.config``` directory.
* Placing the rose-pine-moon-icons folder inside the ```~/.icons``` directory.
* Placing the rose-pine-moon-gtk folder inside the ```~/.themes``` directory.

Use a GTK theming application such as LXAppearance to preview and apply the settings

Install the [Bibata Cursor](https://github.com/ful1e5/Bibata_Cursor#how-to-get-it) theme followed by applying it using LXAppearance.

#### Login Manager

:warning: Make sure you know what you are doing! Check out [this](https://wiki.archlinux.org/title/LightDM) for more information. The system may break if you do it wrong.

Copy the files from the lightdm folder and copy it to ```/etc/lightdm``` folder. You may require sudo privileges to copy the files. 



## Feedback

Suggestions and Improvements are welcome.\
If you have any issues with respect to using this repo to customize your desktop, raise a new issue [here](https://github.com/harishnkr/NewtonRice/issues/new).\
Pull requests are also accepted, provided the enhancements keep the project as minimal as possible.


