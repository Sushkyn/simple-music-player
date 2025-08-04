<div align="center">

![Description](example.png)

A lightweight terminal-based music player built with mpv.
Search, queue, loop, and play — from YouTube or FLAC collections.
</div>

---

#### Features
 
 - Create & play your playlist: `./simple-music-player playlist.txt`, save your song names in playlist.txt
 - Create & play your playlist for flac player:`./simple-flac-player --save "song_name" >> playlist.txt`
 - Loop current song with Shift+l
 - skip current song with q
 - use arrows to skip seconds in current song
 - download the flac songs with wget url.
#### Required packages

`fzf wget jq ffmpeg mpv yt-dlp espeak`

#### Run the Music Player
```
curl -LO https://raw.githubusercontent.com/Sushkyn/simple-music-player/main/simple-music-player && chmod +x simple-music-player && ./simple-music-player
```
#### Run the Flac Player
```
curl -LO https://raw.githubusercontent.com/Sushkyn/simple-music-player/main/simple-flac-player && chmod +x simple-flac-player && ./simple-flac-player
```
#### Get termux notification (add --input-ipc-server=mpvsocket on mpv)
```
curl -LO https://raw.githubusercontent.com/Sushkyn/simple-music-player/main/mpv-termux-notify.sh && chmod +x mpv-termux-notify.sh && ./mpv-termux-notify.sh
