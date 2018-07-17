docker run --rm -it --name emacs\
  -e DISPLAY=$DISPLAY_MAC\
  -v $(pwd):/mnt/workspace\
  -v ~/.Xauthority:/home/emacs/.Xauthority\
  emacs-java-test


