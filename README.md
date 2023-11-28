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
  --debug               Enable debug
  --insecure            Allow insecure server connections when using SSL
  -O OUTPUT, --output OUTPUT
                        output file
  -t TIMEOUT, --timeout TIMEOUT
                        Timeout in seconds
  -U USER_AGENT, --user-agent USER_AGENT
                        User agent
  -V, --version         Show version and exit
```

## Requirements

- Docker or Podman for the Docker image

Otherwise:

- Tested on Python 3.8+
- [Selenium](https://pypi.org/project/selenium/)
- Latest [geckodriver](https://github.com/mozilla/geckodriver/releases)
