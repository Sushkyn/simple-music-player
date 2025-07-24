<div align="center">

![Description](example.png)

A lightweight terminal-based music player and album downloader built with mpv.
Search, queue, loop, and play — from YouTube or local FLAC collections.
</div>

---

#### Features
 
 - Create & play your playlist in a text file format. Ex: `./simple-music-player playlist.txt`
 - Play your local downloaded albums. Select number 3 in the menu and enter path.
 - High quality audio .Flac streaming. Select number 2 in the menu and enter a single.
 - Loop current song with Shift+l
 - skip current song with q
 - use arrows to skip seconds in current song


#### Required packages

`fzf wget jq ffmpeg mpv yt-dlp espeak`

#### Run the Music Player
```
curl -LO https://raw.githubusercontent.com/Sushkyn/simple-music-player/main/simple-music-player && chmod +x simple-music-player && ./simple-music-player
```

#### Download FLAC Albums from Archive.org
```
curl -LO https://raw.githubusercontent.com/Sushkyn/simple-music-player/main/simple-album-download && chmod +x simple-album-download && ./simple-album-download
```
