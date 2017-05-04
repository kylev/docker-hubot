## Hubot

This is a Docker image for [Hubot](https://hubot.github.com) based on the [Getting Started](https://hubot.github.com/docs/) documentation and [hubot-generator](https://github.com/github/generator-hubot). It supplements with several JS-only chat adapters to make the out-of-box experience easy and serve as a reasonable basis for customization.

It contains [adapters](https://hubot.github.com/docs/adapters/) for:

* Campfire
* HipChat
* Slack
* Shell
* XMPP (Jabber)

## Quick Start

Getting up and running with an ephemeral Hubot instance is easy:

``` console
$ docker run -d --rm --name=mybot \
    -e HUBOT_SLACK_TOKEN=xoxb-YOUR-KEY-HERE \
    kylev/hubot \
    --adapter slack
```

## As a Base Image

Want to build your own image with a custom script and hubot-auth added for fine tuned control and your own custom script? Just write your own `Dockerfile`. I've included `[jq](https://stedolan.github.io/jq/)` in the image to simplify handling JSON configs.

``` console
FROM kylev/hubot:latest

RUN \
  npm install --save --production --silent hubot-auth && \
  jq '. += ["hubot-auth"]' external-scripts.json > new-scripts.json && \
  mv new-scripts.json external-scripts.json

ADD custom_thingy.coffee /hubot/scripts/
```

## Contributors

If you would like to contribute, please follow the existing style and write a pull request! Short of that, detailed bug reports are always appreciated.

## License

MIT, probably.
