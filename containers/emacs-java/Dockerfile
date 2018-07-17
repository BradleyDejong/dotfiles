FROM jare/emacs:latest

MAINTAINER Bradley DeJong <bradley.dejong@gmail.com>

ENV UNAME="brad"

RUN mkdir -p ${UHOME}/.emacs.d
ADD https://raw.githubusercontent.com/BradleyDejong/dotfiles/master/.emacs.d/config.org ${UHOME}/.emacs.d/config.org
ADD https://raw.githubusercontent.com/BradleyDejong/dotfiles/master/.emacs ${UHOME}/.emacs

RUN asEnvUser emacs -nw -batch -u ${UNAME} -q -kill

