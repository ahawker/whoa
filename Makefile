.DEFAULT_GOAL := help

.PHONY: test-install
test-install:  ## Install dependencies required for local test execution.
	@pip install -q -r requirements/test.txt

.PHONY: test
test: test-install  ## Run test suite.
	@py.test -v tests

.PHONY: tox-install
tox-install:  ## Install dependencies required for local test execution using tox.
	@pip install -q -r requirements/tox.txt

.PHONY: tox
tox: tox-install  ## Run test suite using tox.
	@tox

.phony: help
help: ## Print Makefile usage.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
