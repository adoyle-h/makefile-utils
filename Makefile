include ./makefile-utils/*.mk
.DEFAULT_GOAL := help

.PHONY: build
# @desc Create dist/makefile-utils.tgz
build:
	@rm -rf tmp/*
	@mkdir -p tmp/makefile-utils dist
	@cp makefile-utils/*.mk tmp/makefile-utils/
	@cp Makefile tmp/
	@cp -r bin tmp/
	@tar -czvf ./dist/makefile-utils.tgz -C ./tmp .

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

.PHONY: init
init: DEFAULT_TARGET ?= help
init: GITIGNORE ?= $(OUTPUT)/.gitignore
init: MAKEFILE ?= $(OUTPUT)/Makefile
init: EDITORCONFIG ?= $(OUTPUT)/.editorconfig
init:
ifndef OUTPUT
	$(error OUTPUT is undefined)
endif

	@if [[ ! -d '$(OUTPUT)' ]]; then echo "The OUTPUT '$(OUTPUT)' is not a directory" >&2; exit 3; fi

	@mkdir -p '$(OUTPUT)/makefile-utils'
	@cp -f ./makefile-utils/*.mk '$(OUTPUT)/makefile-utils/'

	@grep -F 'include ./makefile-utils/*.mk' '$(MAKEFILE)' &>/dev/null ||\
		printf '\ninclude ./makefile-utils/*.mk\n' >> '$(MAKEFILE)'

	@if [[ -n '$(DEFAULT_TARGET)' ]]; then \
		grep -F '.DEFAULT_GOAL' '$(MAKEFILE)' &>/dev/null ||\
			echo '.DEFAULT_GOAL := $(DEFAULT_TARGET)' >> '$(MAKEFILE)' ;\
	fi

	@if [[ -f '$(GITIGNORE)' ]]; then \
		grep -F '/makefile-utils/*' '$(GITIGNORE)' &>/dev/null ||\
			printf '\n/makefile-utils/*\n' >> '$(GITIGNORE)' ;\
		grep -F '!/makefile-utils/*.mk' '$(GITIGNORE)' &>/dev/null ||\
			echo '!/makefile-utils/*.mk' >> '$(GITIGNORE)' ;\
	fi

	@if [[ -f '$(EDITORCONFIG)' ]]; then \
		grep -F '[{Makefile,*.mk}]' '$(EDITORCONFIG)' &>/dev/null || {\
			printf '\n[{Makefile,*.mk}]\n' >> '$(EDITORCONFIG)' &&\
			echo 'indent_style = tab' >> '$(EDITORCONFIG)' ;\
		};\
	fi

	@echo 'DONE'
