include ./makefile-utils/*.mk
.DEFAULT_GOAL := help

.PHONY: build
# @desc Create dist/makefile-utils.tgz
build:
	@mkdir -p dist
	@tar -czvf ./dist/makefile-utils.tgz ./makefile-utils/*.mk

# @target bump-major  bump major version (x)
# @target bump-minor  bump minor version (y)
# @target bump-patch  bump patch version (z)
BUMP_TARGETS := $(addprefix bump-,major minor patch)
.PHONY: $(BUMP_TARGETS)
$(BUMP_TARGETS):
	@$(MAKE) $(subst bump-,semver-,$@) > VERSION
	@sed -i.bak -E "s/^VERSION=.+/VERSION=v$$(cat VERSION)/" README.md
	@rm README.md.bak

.PHONY: changelog
# @desc Generate and update the CHANGELOG file
changelog:
	$(MAKE) CHANGELOG NEXT_VERSION=$(shell cat VERSION)
