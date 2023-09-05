BIN=xget
FILES=$(BIN)

.PHONY: all
all: flake8 pylint

.PHONY: flake8
flake8:
	@flake8 --ignore=E501 $(FILES)

.PHONY: mypy
mypy:
	@mypy $(FILES)

.PHONY: pylint
pylint:
	@pylint --disable=line-too-long,too-many-arguments,too-many-locals $(FILES)

.PHONY: e2e
e2e:
	@bash tests/e2e.sh
