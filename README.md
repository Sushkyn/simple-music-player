<div align="center">
A lightweight terminal-based music player and album downloader built with mpv.
Search, queue, loop, and play — from YouTube or local FLAC collections.

![Description](example.png)
</div>
---

#### Features
 
 - Play & share your playlist in a text file format. ex: `./simple-music-player playlist.txt`
 - Play your local albums. `./simple-music-player /path/to/your/album_directory`
---


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
