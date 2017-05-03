FROM node:7-alpine
MAINTAINER Kyle VanderBeek <kylev@kylev.com>

# https://github.com/mhart/alpine-node/issues/27
# RUN apk add --no-cache make gcc g++ python

# Install Hubot
RUN \
  npm install -g --production --silent \
    coffee-script \
    generator-hubot \
    yo && \
  mkdir /hubot && chown node:node /hubot

WORKDIR /hubot

USER node
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
