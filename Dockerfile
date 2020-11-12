FROM	python:3.9-alpine

COPY    requirements.txt /tmp

RUN	apk add --no-cache \
		firefox-esr \
		tzdata

RUN	pip install --no-cache-dir -r /tmp/requirements.txt

RUN	wget -q -O- https://github.com/mozilla/geckodriver/releases/download/v0.27.0/geckodriver-v0.27.0-linux64.tar.gz | tar zxf - -C /usr/local/bin/

COPY	xcurl /

ENV     PYTHONPATH .
ENV	PYTHONUNBUFFERED 1

RUN	adduser -D user
WORKDIR	/home/test
USER	user

ENTRYPOINT ["/xcurl"]
