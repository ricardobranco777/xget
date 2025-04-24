![Build Status](https://github.com/ricardobranco777/xget/actions/workflows/ci.yml/badge.svg)

# xget
xget gets content from dynamic webpages where curl & wget fail

Docker image available at `ghcr.io/ricardobranco777/xget:latest`

## Usage:

```
usage: xget [-h] [--debug] [--insecure] [-O OUTPUT] [-t TIMEOUT] [-U USER_AGENT] [--version] url [url ...]

positional arguments:
  url

options:
  -h, --help            show this help message and exit
  --debug               enable debug (default: False)
  --insecure            allow insecure server connections when using SSL (default: False)
  -O OUTPUT, --output OUTPUT
                        output file (default: None)
  -t TIMEOUT, --timeout TIMEOUT
                        timeout in seconds (default: 5)
  -U USER_AGENT, --user-agent USER_AGENT
                        user agent (default: None)
  --version             show program's version number and exit
```

## Requirements

- Docker or Podman for the Docker image

Otherwise:

- Tested on Python 3.13
- [Selenium](https://pypi.org/project/selenium/)
- Latest [geckodriver](https://github.com/mozilla/geckodriver/releases)
