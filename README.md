## Hubot

This is a Docker image for [Hubot](https://hubot.github.com) based on the [Getting Started](https://hubot.github.com/docs/) documentation and [hubot-generator](https://github.com/github/generator-hubot). It supplements with several JS-only chat adapters to make the out-of-box experience easy and serve as a reasonable basis for customization.

## Code Example

Getting up and running with an ephemeral Hubot instance is easy:

``` console
$ docker run -d --rm --name=mybot \
    -e HUBOT_SLACK_TOKEN=xoxb-YOUR-KEY-HERE \
    kylev/hubot \
    --adapter slack
```

## Contributors

If you would like to contribute, please follow the existing style and write a pull request! Short of that, detailed bug reports are always appreciated.

## License

MIT, probably.
