FILES=xget

.PHONY: all
all: flake8 pylint mypy black geckodriver

.PHONY: flake8
flake8:
	@flake8 --ignore=E501 $(FILES)

.PHONY: mypy
mypy:
	@mypy $(FILES)

.PHONY: pylint
pylint:
	@pylint --disable=line-too-long,too-many-arguments,too-many-locals $(FILES)

.PHONY: black
black:
	@black --check $(FILES)

.PHONY: e2e
e2e:
	@bash tests/e2e.sh

.PHONY: geckodriver
geckodriver:
	@grep -q "geckodriver-$$(curl -s https://api.github.com/repos/mozilla/geckodriver/releases/latest | jq -r '.tag_name')" Dockerfile || echo Update Dockerfile with latest geckodriver
