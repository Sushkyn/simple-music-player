#!/data/data/com.termux/files/usr/bin/bash

send_command() {
    echo "$1" | socat - /data/data/com.termux/files/home/mpvsocket
}

send_notification() {
    termux-notification --title "Playback" --content "Control playback" \
    --button1 "<" --button1-action "bash mpv-termux-notify.sh prev" \
    --button2 "|>" --button2-action "bash mpv-termux-notify.sh pause" \
    --button3 ">" --button3-action "bash mpv-termux-notify.sh next"
}

case "$1" in
    prev)
        send_command "playlist-prev"
        ;;
    pause)
        send_command "cycle pause"
        ;;
    next)
        send_command "playlist-next"
        ;;
    *)
        send_notification
        ;;
esac
