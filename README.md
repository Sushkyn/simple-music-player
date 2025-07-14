A lightweight terminal-based music player and album downloader built with mpv.
Search, queue, loop, and play — from YouTube or local FLAC collections.

### Requirements
simple-music-player:
mpv, yt-dlp, espeak or espeak-ng (for optional voice feedback)

simple-album-downloader:
fzf (for fuzzy selection), wget, jq

    
### Run the Music Player
```
curl -LO https://raw.githubusercontent.com/Sushkyn/simple-music-player/main/simple-music-player && chmod +x simple-music-player && ./simple-music-player

```
Play a Local Album
```

./simple-music-player /path/to/your/album_directory

```
 ### Download FLAC Albums from Archive.org
```

curl -LO https://raw.githubusercontent.com/Sushkyn/simple-music-player/main/simple-album-download && chmod +x simple-album-download && ./simple-album-download

```
