if playerctl --player spotify status &> /dev/null; then
    ~/.config/hypr/playing.py --player spotify
    wget -q -P /home/reddz/.config/hypr/assets/ -O /home/reddz/.config/hypr/assets/cover.jpg $(playerctl -p spotify metadata | grep artUrl | awk '{ print $3 }')
else
    rm -f /home/reddz/.config/hypr/assets/cover.jpg
    echo " "
fi
