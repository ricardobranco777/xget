# xcurl
xcurl gets the HTML from dynamic webpages where curl fails

[![Build Status](https://travis-ci.org/ricardobranco777/xcurl.svg?branch=master)](https://travis-ci.org/ricardobranco777/xcurl)

## Usage:

```
usage: xcurl [-h] [-t TIMEOUT] url

positional arguments:
  url

optional arguments:
  -h, --help            show this help message and exit
  --debug               Enable debug
  --insecure            Allow insecure server connections when using SSL
  -t TIMEOUT, --timeout TIMEOUT
                        Timeout in seconds
```

## Requirements

- Python 3
- Python Selenium
- Geckodriver
