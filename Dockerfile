FROM	python:3.10-alpine

COPY    requirements.txt /tmp

RUN	apk add --no-cache \
		firefox-esr \
		tzdata

RUN	apk --no-cache --virtual .build-deps add \
		gcc \
                libc-dev \
                libffi-dev && \
	pip install --no-cache-dir -r /tmp/requirements.txt && \
        apk del .build-deps

RUN	wget -q -O- https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz | tar zxf - -C /usr/local/bin/

COPY	xget /

ENV     PYTHONPATH .
ENV	PYTHONUNBUFFERED 1

RUN	adduser -D user
WORKDIR	/home/test
USER	user

ENTRYPOINT ["/xget"]
