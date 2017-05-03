## Hubot in Docker

This is a docker image based on
the [hubot-generator](https://github.com/github/generator-hubot) and
official [Getting Started](https://hubot.github.com/docs/)
documentation. It supplements with several adapters to make the
out-of-box experience easy and serve as a reasonable basis for
customization.

## Code Example

Getting up and running with an ephemeral Hubot instance is easy:

``` console
$ docker run -d --rm --name=mybot \
    -e HUBOT_SLACK_TOKEN=xoxb-YOUR-KEY-HERE \
    kylev/hubot \
    --adapter slack
```

Show what the library does as concisely as possible, developers should
be able to figure out **how** your project solves their problem by
looking at the code example. Make sure the API you are showing off is
obvious, and that your code is short and concise.

## Contributors

If you would like to contribute, please follow the existing style and
write a pull request! Short of that, detailed bug reports are always
appreciated.

## License

MIT, probably.
