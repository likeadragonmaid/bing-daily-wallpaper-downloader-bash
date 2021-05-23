# Bing Daily Wallpaper Downloader

Bing daily wallpaper downloader written in bash.

# Features:
* Downloads bing daily wallpaper according to user's country.
* Saves the wallpaper to ~/Pictures/bing/ .
* Set downloaded wallpaper on desktop automatically.

Dependencies: lynx, nitrogen and locale.
```sh
sudo apt install lynx nitrogen
   ```

## Customisation:

## To set custom language modify
```sh
language=en
   ```

## To set custom directory where wallpaper gets saved modify
```sh
DIRECTORY=~/Pictures/bing/
   ```
## To set custom country

Uncomment this line and set your own country
```sh
country=US
   ```

## First time downloading and running

```sh
wget https://raw.githubusercontent.com/shoukolate/bing-daily-wallpaper-downloader-bash/master/bing-daily-wallpaper-downloader.sh && chmod +x bing-daily-wallpaper-downloader.sh && ./bing-daily-wallpaper-downloader.sh
   ```
   
## To run later on

```sh
./bing-daily-wallpaper-downloader.sh
   ```

This code is based on https://github.com/CubLinux/one/blob/master/Debian%20Packages/chromecast-daily-wallpaper/bing-daily-wallpaper by RichJack
