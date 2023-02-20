# Makefile Utils

A series of makefile targets for enhancing your Makefile.

## Feature

![make-help.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/makefile-utils/make-help.png)

## Versioning

Read [tags][] for versions.
The versions follow the rules of [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html).

## Installation

You can install it by `curl` or `git`.

### Curl

```sh
VERSION=v0.1.0
curl -LO "https://github.com/adoyle-h/makefile-utils/releases/download/$VERSION/makefile-utils.tgz{,.md5}"

# Check files integrity
md5sum -c ./*.md5

tar -xzf ./makefile-utils.tgz
```

### Git

```sh
VERSION=v0.1.0
git clone --depth 1 --branch "$VERSION" https://github.com/adoyle-h/makefile-utils.git
```

## Usage
<!-- editorconfig-checker-disable -->

```sh
cp -r makefile-utils $your_project

printf '\ninclude ./makefile-utils/*.mk\n' >> $your_project/Makefile

# Or only include a file for `make help`.
# printf '\ninclude ./makefile-utils/help.mk\n' >> $your_project/Makefile

# git ignore some files
printf '\n/makefile-utils/*\n!/makefile-utils/*.mk\n' >> $your_project/.gitignore

# You can make `help` as default target. (Skip if you don't need)
printf '\n.DEFAULT_GOAL := help\n' >> $your_project/Makefile

# To show usage
make help
```

### make help

By default, it only shows target name. Add `@desc {description}` before target for printing description.

Do not support makefile functions like `$(target):`. You can add `@target {name} {description}` in Makefile.

### make semver-*

`make semver-major` only print version. You can call the target in your Makefile.

For example, to replace `VERSION=v...` in README file.

```make
# @target bump-major  bump major version (x)
# @target bump-minor  bump minor version (y)
# @target bump-patch  bump patch version (z)
BUMP_TARGETS := $(addprefix bump-,major minor patch)
.PHONY: $(BUMP_TARGETS)
$(BUMP_TARGETS):
	@$(MAKE) $(subst bump-,semver-,$@) > VERSION
	@sed -i.bak -E "s/^VERSION=.+/VERSION=v$$(cat VERSION)/" README.md
	@rm README.md.bak VERSION
```

## Copyright and License

Copyright 2023 ADoyle (adoyle.h@gmail.com). Some Rights Reserved.
The project is licensed under the **Apache License Version 2.0**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.

## Other Projects

- [Other shell projects](https://github.com/adoyle-h?tab=repositories&q=&type=source&language=shell&sort=stargazers) created by me.


<!-- links -->

[tags]: https://github.com/adoyle-h/makefile-utils/tags
[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE
