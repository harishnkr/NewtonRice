#!/bin/bash

killall -q polybar
polydir="$HOME/.config/polybar/newton"

echo "---" | tee -a /tmp/polybar.log 
polybar -r simple -c 2>&1 ${polydir}/simple.ini | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

