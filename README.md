# xget
xget gets the HTML from dynamic webpages where curl & wget fail

[![Build Status](https://travis-ci.com/ricardobranco777/xget.svg?branch=master)](https://travis-ci.org/ricardobranco777/xget)

## Usage:

```
usage: xget [-h] [--debug] [--insecure] [-O OUTPUT] [-t TIMEOUT] [-U USER_AGENT] url [url ...]

positional arguments:
  url

optional arguments:
  -h, --help            show this help message and exit
  --debug               Enable debug
  --insecure            Allow insecure server connections when using SSL
  -O OUTPUT, --output OUTPUT
                        output file
  -t TIMEOUT, --timeout TIMEOUT
                        Timeout in seconds
  -U USER_AGENT, --user-agent USER_AGENT
                        User agent
```

## Requirements

- Python 3.7+
- Python Selenium
- Geckodriver
