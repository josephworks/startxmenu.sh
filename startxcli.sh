# !/bin/bash

# Check for sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root!"
  exit
fi

# Warning about .xinitrc being moved
echo "Warning: your current .xinitrc config will be renamed to xinit"

read -p "Continue? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # Initialize if user agreed to .xinitrc being moved
    cd
    sudo mv .xinitrc xinit
    clear
    read -p "StartX> " -r
fi

if [[ $REPLY = help ]]
then
    echo "StartXCli.sh - V2"
    echo "A CLI used to start up a selected Desktop Environment in a TTY instance"
    echo "SRC: https://github.com/josephworks/StartXCli.sh"
    echo ""
    echo "Commands:"
    echo "revert - reverts your .xinitrc file from latest backup"
    echo "reset - resets the .xinitrc config"
    echo "recent, last - starts the last desktop environment that you used"
    echo "exit, close, quit - closes StartXCli"
    echo "i3 - starts I3"
    echo "lxde - starts LXDE"
    echo "xfce - starts XFCE4"
    echo "gnome - starts the gnome shell"
    echo "budgie - stars up Ubuntu Budgie Desktop (Note: For Ubuntu Only!)"
    echo "openbox - starts OpenBox"
    echo "fluxbox - starts FluxBox"
    echo "htop - opens htop"
    echo "iptraf - opens iptraf-ng and displays network trafic"
    read -p "StartX> " -r
fi

############# Exit Commands
if [[ $REPLY = exit ]]
then
    echo "Exited"
fi

if [[ $REPLY = close ]]
then
    echo "Exited"
fi

if [[ $REPLY = quit ]]
then
    echo "Exited"
fi
############

########## xinit config commands
# Revert Command
if [[ $REPLY = revert ]]
then
    sudo mv xinit .xinitrc
    echo "Restored config!"
    read -p "StartX> " -r
fi

# Reset command
if [[ $REPLY = reset ]]
then
    sudo rm .xinitrc
    echo "Reseted xinitrc config!"
    read -p "StartX> " -r
fi

########## Start Desktop Env Commands
if [[ $REPLY = lxde ]]
then
    echo "#Config generated by StartXCli" > ~/.xinitrc
    echo "startlxde" > ~/.xinitrc
    startx
    echo "Opperation completed sucessfully!"
fi

if [[ $REPLY = xfce ]]
then
    echo "#Config generated by StartXCli" > ~/.xinitrc
    echo "exec startxfce4" > ~/.xinitrc
    startx
    echo "Opperation completed sucessfully!"
fi

if [[ $REPLY = gnome ]]
then
    echo "#Config generated by StartXCli" > ~/.xinitrc
    echo "gnome-shell" > ~/.xinitrc
    startx
    echo "Opperation completed sucessfully!"
fi

if [[ $REPLY = openbox ]]
then
    echo "#Config generated by StartXCli" > ~/.xinitrc
    echo "exec openbox" > ~/.xinitrc
    startx
    echo "Opperation completed sucessfully!"
fi

if [[ $REPLY = budgie ]]
then
    echo "#Config generated by StartXCli" > ~/.xinitrc
    echo "exec budgie-desktop" > ~/.xinitrc
    startx
    echo "Opperation completed sucessfully!"
fi

if [[ $REPLY = i3 ]]
then
    echo "#Config generated by StartXCli" > ~/.xinitrc
    echo "exec i3" > ~/.xinitrc
    startx
    echo "Opperation completed sucessfully!"
fi

########## Extras
if [[ $REPLY = htop ]]
then
    htop
fi

if [[ $REPLY = iptraf ]]
then
    sudo iptraf-ng
fi

if [[ $REPLY = recent ]]
then
    startx
    echo "Opperation completed sucessfully!"
fi

if [[ $REPLY = last ]]
then
    startx
    echo "Opperation completed sucessfully!"
fi
