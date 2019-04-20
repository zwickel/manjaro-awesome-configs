#!/bin/sh

# create directories for config files and copy them there
mkdir -p ~/.config/conky/
cp conky_shortcuts.conf ~/.config/conky/
cp conky.conf ~/.config/conky/
cp conky_weather.conf ~/.config/conky/
cp weather.lua ~/.config/conky/

# add call of conky to autostart
echo $'# run conky\nconky -c ~/.config/conky/conky_shortcuts.conf\nconky -c ~/.config/conky/conky_weather.conf\nconky -c ~/.config/conky/conky.conf' >> ~/.config/awesome/autorun.sh
# without the $ (dollar-sign) the escape-sequences (\n) wouldn't be recognized
