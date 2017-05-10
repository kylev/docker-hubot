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
    -e HUBOT_SLACK_TOKEN=xoxb-YOUR-KEY/HERE \
    kylev/hubot \
    --adapter slack
```

Or you can use docker-compose to add persistence by setting a `REDIS_URL` that [hubot-redis-brain](https://github.com/hubot-scripts/hubot-redis-brain) will use.

``` yml
version: '2'
services:
  redis:
    image: redis
    volumes:
      - redis:/data
  hubot:
    image: kylev/hubot
    command: -a slack
    depends_on:
      - redis
    environment:
      HUBOT_SLACK_TOKEN: xoxb-YOUR-KEY/HERE
      REDIS_URL: redis://redis

volumes:
  redis:
```

## As a Base Image

Want to build your own image with a custom script and hubot-auth added for fine tuned control and your own custom script? Just write your own `Dockerfile`. I've included [`jq`](https://stedolan.github.io/jq/) in the image to simplify handling JSON configs.

``` Dockerfile
FROM kylev/hubot:latest

RUN \
  npm install --save --production --silent hubot-auth && \
  jq '. += ["hubot-auth"]' external-scripts.json > new-scripts.json && \
  mv new-scripts.json external-scripts.json

ADD custom_thingy.coffee /hubot/scripts/
```

Or maybe you just want your own set of packages


``` Dockerfile
FROM kylev/hubot:latest

ENV HUBOT_HIPCHAT_JID yourvaluehere
# Set more hubot config env here.

RUN \
  npm install --save --production --silent \
    hubot-business-cat hubot-trello hubot-plusplus hubot-mongodb-brain
COPY my-scripts.json external-scripts.json

CMD ["-a", "hipchat"]
```

## Contributors

If you would like to contribute, please write a [pull request](https://github.com/kylev/docker-hubot/pulls)! Short of that, detailed [bug reports](https://github.com/kylev/docker-hubot/issues) are always appreciated.

## License

MIT.
