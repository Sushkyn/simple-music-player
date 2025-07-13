#!/data/data/com.termux/files/usr/bin/bash
command -v yt-dlp >/dev/null || { echo "#  yt-dlp not found"; exit 1; }
command -v ffmpeg >/dev/null || { echo "#  ffmpeg not found"; exit 1; }
command -v aplay >/dev/null || { echo "#  aplay not found"; exit 1; }

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CACHEDIR="$SCRIPT_DIR/cachemusic"
mkdir -p "$CACHEDIR"

# Cleanup on exit
cleanup() {
    echo -e "\n Cleaning up..."
    rm -rf "$CACHEDIR"
    exit 0
}
trap cleanup INT TERM EXIT

while true; do
	echo " Add songs to queue. press Enter to start playing."
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

    echo -e "\nStarting playback... (press 'n' to skip current song)\n"

    for song in "${queue[@]}"; do
        ts=$(date +%s%N)
        AUDIO_MP3="$CACHEDIR/audio_$ts.mp3"
        AUDIO_WAV="$CACHEDIR/audio_$ts.wav"

        echo "#  Now playing: $song"

        yt-dlp -f 'bestaudio[abr<=128]' --extract-audio --audio-format mp3 \
            --output "$AUDIO_MP3" "ytsearch1:$song" >/dev/null 2>&1

        if [ ! -f "$AUDIO_MP3" ]; then
            echo "#  Failed to download: $song"
            continue
        fi

        ffmpeg -loglevel quiet -y -i "$AUDIO_MP3" -f wav "$AUDIO_WAV" &

        echo -n "# #  Preparing audio"
        while [ ! -s "$AUDIO_WAV" ]; do
            sleep 0.5
            echo -n "."
        done
        echo ""

        aplay "$AUDIO_WAV" &
        APLAY_PID=$!

        while kill -0 $APLAY_PID 2>/dev/null; do
            read -rsn1 -t 0.1 key
            if [[ "$key" == "n" ]]; then
                echo " Skipping..."
                kill $APLAY_PID
                wait $APLAY_PID 2>/dev/null
                break
            fi
        done

        echo ""
    done

    echo " Queue finished. Add more songs or Ctrl+C to quit."
done
