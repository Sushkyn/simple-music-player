#!/data/data/com.termux/files/usr/bin/bash

command -v yt-dlp >/dev/null || { echo " yt-dlp not found"; exit 1; }
command -v mpv >/dev/null || { echo "  mpv not found"; exit 1; }

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CACHEDIR="$SCRIPT_DIR/cachemusic"
mkdir -p "$CACHEDIR"

cleanup() {
    echo -e "\n Cleaning up..."
    rm -rf "$CACHEDIR"
    exit 0
}
trap cleanup INT TERM EXIT

while true; do
    echo " Add songs to queue. Press Enter when done:"
    queue=()

    while true; do
        read -rp ">_: " song
        [ -z "$song" ] && break
        queue+=("$song")
    done

    if [ ${#queue[@]} -eq 0 ]; then
        echo " Queue is empty. Add songs first."
        continue
    fi

    echo -e "\n Starting playback... (press 'n' to skip current song)\n"

    for song in "${queue[@]}"; do
        echo " Now playing: $song"

        STREAM_URL=$(yt-dlp -f 'bestaudio[abr<=64]/bestaudio' -g "ytsearch1:$song" 2>/dev/null)

        if [ -z "$STREAM_URL" ]; then
            echo " Failed to get stream URL for: $song"
            continue
        fi

        mpv --no-video --quiet "$STREAM_URL" &
        MPV_PID=$!

        while kill -0 $MPV_PID 2>/dev/null; do
            read -rsn1 -t 0.1 key
            if [[ "$key" == "n" ]]; then
                echo " Skipping..."
                kill $MPV_PID
                wait $MPV_PID 2>/dev/null
                break
            fi
        done

        echo ""
    done

    echo " Queue finished. Add more songs or Ctrl+C to quit."
done
