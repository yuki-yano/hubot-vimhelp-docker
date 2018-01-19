FROM node:latest

ENV HUBOT_VIMHELP_PLUGINS_DIR /app/vim/plugins/
ENV HUBOT_VIMHELP_HELPLANG ja,en

WORKDIR /app
ADD . /app

RUN mkdir -p /app/vim/plugins

RUN apt-get -y update && apt-get -y install vim nodejs locales
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LC_CTYPE ja_JP.UTF-8
ENV LC_MESSAGES ja_JP.UTF-8
ENV LC_NUMERIC ja_JP.UTF-8
ENV LC_TIME ja_JP.UTF-8

RUN localedef -f UTF-8 -i ja_JP ja_JP.utf8

RUN yarn install

CMD ["bin/hubot"]
