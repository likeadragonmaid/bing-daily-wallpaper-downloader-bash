#!/bin/bash
# bing-daily-wallpaper
# Version 0.1
# 
# Simple command line tool which will grab a the Bing daily 
# wallpaper using the Bing RSS feed.
#
# Depends: lynx, nitrogen, locale
# 
# Created by RichJack, 2015 designed for Chromixium OS:
# http://chromixium.org
#
# Modified by Shou
# https://shoukolate.ml/
# 
# Licence: GPL v3
#
# bing-daily-wallpaper is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version 2 of
# the License, or (at your option) any later version.
#
# Chromecast-daily-wallpaper is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Chromecast-daily-wallpaper.  If not, see
# <http://www.gnu.org/licenses/>.
#
# Modifications:
# 1. Downloads bing daily wallpaper according to user's country.
# 2. Also saves the wallpaper to ~/Pictures/bing/

# To set custom language
language=en

# To set custom directory where wallpaper gets saved
DIRECTORY=~/Pictures/bing/

tempcountry=$(locale)
country=$(echo $tempcountry | cut -b9-10)

# To set custom country
# country=IN

bing=$(lynx -source "http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=$language-$country" | awk -F ".jpg" '{print $1}' | awk -F "<url>" '{print $2}')
bing="https://www.bing.com${bing}.jpg"

wget -O /tmp/bingdailywallpaper.jpg "$bing"

nitrogen --set-scaled --save "/tmp/bingdailywallpaper.jpg"

if [ ! -d "$DIRECTORY" ]; then
  mkdir $DIRECTORY
fi
cd $DIRECTORY
tempcount=$(ls | wc -l)
count=$((tempcount+1))
cd ~
cp /tmp/bingdailywallpaper.jpg $DIRECTORY$count.jpg
