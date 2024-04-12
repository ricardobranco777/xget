FROM	python:3.11-alpine

COPY    requirements.txt /tmp

RUN	apk add --no-cache \
		firefox \
		tzdata \
		xvfb

RUN	pip install --no-cache-dir -r /tmp/requirements.txt

RUN	wget -q -O- https://github.com/mozilla/geckodriver/releases/download/v0.34.0/geckodriver-v0.34.0-linux64.tar.gz | tar zxf - -C /usr/local/bin/

COPY	xget /

ENV	DBUS_SESSION_BUS_ADDRESS /dev/null

RUN	adduser -D user
WORKDIR	/home/test
USER	user

ENTRYPOINT ["/xget"]
