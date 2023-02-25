.PHONY: md-check-links
md-check-links: LYCHEE_OPTS ?= --exclude-path ./makefile-utils --exclude-all-private --exclude-mail --timeout 3 -r 3 --insecure

# @desc Check dead links in markdown files
md-check-links:
ifeq (, $(shell which lychee))
	$(error "Not found lychee in PATH. Please install it by yourself. See https://github.com/lycheeverse/lychee")
endif
	@lychee $(LYCHEE_OPTS) .
