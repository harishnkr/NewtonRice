#!/bin/sh

# xrandr
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# This snippet is indended to be paseted in `.xinitrc'. Then D-Bus Daemon
# can be started on startup and all sub-processes the windows manager can
# communicate with the daemon.
#
# `.bashrc' also can source the file `/tmp/dbus-session$UID' to restore the
# environment variables

# dbus_address=$(echo "$DBUS_SESSION_BUS_ADDRESS" |\
#               awk 's/^.*unix:abstract=\([^,]*\),.*$/\1/')
# if [ -S "$dbus_address" ] && netstat -nlpx 2> /dev/null |\
#                              awk '{print $NF}' |\
#                              grep -qF "$dbus_address"; then
#    echo "export DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS" > /tmp/dbus-session$UID
#    if [ -n "$DBUS_SESSION_BUS_PID" ]; then
#        echo "export DBUS_SESSION_BUS_PID=$DBUS_SESSION_BUS_PID" >> /tmp/dbus-session$UID
#    fi
# else
#    process=
#    [ -f /tmp/dbus-session$UID ] && source /tmp/dbus-session$UID > /dev/null
#    if [ -n "$DBUS_SESSION_BUS_PID" ]; then
#        process=$(ps -p "$DBUS_SESSION_BUS_PID" -o comm= 2> /dev/null)
#    fi
#    if [ "$process" != "dbus-daemon" ]; then
#        dbus-launch --sh-syntax --exit-with-session > /tmp/dbus-session$UID
#        source /tmp/dbus-session$UID
#        export DBUS_SESSION_BUS_ADDRESS DBUS_SESSION_BUS_PID
#    fi
# fi


# exec bspwm
#exec awesome
