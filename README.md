<div align="center">

![Description](example.jpg)

A lightweight terminal-based music player built with mpv.
Search, queue, loop, and play — from YouTube or FLAC collections.
</div>

---

#### Features

 - add songs to queue inside music player.
 - save your song names under playlist.txt
 - play your playlist: `./simple-music-player playlist.txt`, or `./simple-flac-player playlist.txt`
 - add new songs inside txt while playlist is playing.
 - download your playlist.txt songs with `./simple-flac-player -d playlist.txt`
 - Loop current song with Shift+L
 - skip current song with q
 - use arrows to skip seconds in current song

   #### Required packages

`wget jq ffmpeg mpv yt-dlp espeak tmux`


#### Run the Flac Player 
```
curl -LO https://raw.githubusercontent.com/Sushkyn/simple-music-player/main/simple-flac-player && chmod +x simple-flac-player && ./simple-flac-player
```
#### optional: Get termux notification (add --input-ipc-server=mpvsocket on mpv)
```
curl -LO https://raw.githubusercontent.com/Sushkyn/simple-music-player/main/mpv-termux-notify.sh && chmod +x mpv-termux-notify.sh && ./mpv-termux-notify.sh
