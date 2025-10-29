if [ -f "$HOME/.Xresources" ]; then
	xrdb -merge "$HOME/.Xresources"
fi

feh --bg-fill ~/.config/wallpapers/wallpaper.png &
slstatus &

picom &

dwm
