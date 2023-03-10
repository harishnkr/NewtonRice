#!/bin/bash

killall -q polybar
polydir="$HOME/.config/polybar/newton"

echo "---" | tee -a /tmp/polybarws.log /tmp/polybaraction.log /tmp/polybarwin.log /tmp/polybarmus.log /tmp/polybarst.log /tmp/polybardt.log
polybar -r workspace -c 2>&1 ${polydir}/config.ini | tee -a /tmp/polybarws.log & disown
polybar -r actionbar -c 2>&1 ${polydir}/config.ini | tee -a /tmp/polybaraction.log & disown
polybar -r window -c 2>&1 ${polydir}/config.ini | tee -a /tmp/polybarwin.log & disown
polybar -r music -c  2>&1 ${polydir}/config.ini | tee -a /tmp/polybarmus.log & disown
polybar -r statusbar -c  2>&1  ${polydir}/config.ini | tee -a /tmp/polybarst.log & disown
polybar -r date -c  2>&1 ${polydir}/config.ini | tee -a /tmp/polybardt.log & disown

echo "Polybar launched..."
