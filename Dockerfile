FROM node:7-alpine
MAINTAINER Kyle VanderBeek <kylev@kylev.com>

# https://github.com/mhart/alpine-node/issues/27
# RUN apk add --no-cache make gcc g++ python

# Install Hubot
RUN \
  npm install -g --production --silent \
  coffee-script \
  generator-hubot \
  yo

RUN mkdir /hubot && chown node:node /hubot
USER node
WORKDIR /hubot

RUN \
  yo --no-insight hubot --name=hubot-container --defaults && \
  rm -f hubot-scripts.json && \
  sed -i '/npm install/d' bin/hubot && \
  npm install --save --production --silent \
    hubot-hipchat \
    hubot-slack \
    hubot-xmpp

ENTRYPOINT ["./bin/hubot"]
# CMD ["--adapter","slack"]
