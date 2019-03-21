#!/bin/sh

# create directories for config files and copy them there
mkdir -p ~/.config/conky/
cp conky1.10_shortcuts_maia ~/.config/conky/
cp conky_maia ~/.config/conky/
cp conky_weather ~/.config/conky/
cp weather.lua ~/.config/conky/

# add call of conky to autostart
echo $'# run conky\nrun conky -c ~/.config/conky/conky1.10_shortcuts_maia\nrun conky -c ~/.config/conky/conky_maia\nrun conky -c ~/.config/conky/conky_weather' >> ~/.config/awesome/autorun.sh
# without the $ (dollar-sign) the escape-sequences wouldn't be recognized
