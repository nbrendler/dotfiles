onemonitor() {
  xrandr --output HDMI2 --primary --auto --output eDP1 --off
  feh --bg-scale ~/.wallpaper/balls.png
}

twomonitor() {
  xrandr --output HDMI1 --primary --auto --output HDMI2 --pos 2560x0 --auto --output eDP1 --off
  feh --bg-scale ~/.wallpaper/pandas.jpg ~/.wallpaper/balls.png
}

laptopmonitor() {
  xrandr --output eDP1 --primary --auto --output HDMI2 --off
  feh --bg-scale ~/.wallpaper/balls.png
}
