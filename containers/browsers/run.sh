
docker run -it --rm\
  -e DISPLAY=$DISPLAY_MAC\
  -v ~/.Xauthority:/home/developer/.Xauthority\
  browser-chrome
