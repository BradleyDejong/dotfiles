FROM jare/emacs:latest

MAINTAINER Bradley DeJong <bradley.dejong@gmail.com>

ENV UNAME="brad"

RUN apt-get update
RUN apt-get install -y software-properties-common git
RUN add-apt-repository universe
RUN apt-get update
RUN apt-get install fonts-firacode
RUN apt-get install -y openjdk-8-jdk && apt-get install -y maven

RUN mvn --version
RUN mkdir -p ${UHOME}/.emacs.d

RUN git clone https://github.com/jdee-emacs/jdee-server.git
RUN (cd jdee-server; mvn -U -Dmaven.test.skip=true package; cp target/jdee-bundle*.jar ${UHOME})
ADD https://raw.githubusercontent.com/BradleyDejong/dotfiles/master/.emacs.d/config.org ${UHOME}/.emacs.d/config.org
ADD https://raw.githubusercontent.com/BradleyDejong/dotfiles/master/.emacs ${UHOME}/.emacs

RUN asEnvUser emacs -nw -batch -u ${UNAME} -q -kill

