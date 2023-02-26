# Makefile Utils

The makefile-utils is helpful for developing with `make` command.
It provides a series of Makefile Targets for enhancing your Makefile.

[English](./README.md) | [中文](./README.zh.md)

## Feature

![make-help.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/makefile-utils/make-help.png)

## Versioning

Read [tags][] for versions.
The versions follow the rules of [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html).

## Installation

You can install it by `curl` or `git`.

### Curl

```sh
VERSION=v0.3.0
curl -LO "https://github.com/adoyle-h/makefile-utils/releases/download/$VERSION/makefile-utils.tgz{,.md5}"

# Check files integrity
md5sum -c ./*.md5

tar -xzf ./makefile-utils.tgz
```

### Git

```sh
VERSION=v0.3.0
git clone --depth 1 --branch "$VERSION" https://github.com/adoyle-h/makefile-utils.git
```

## Usage
<!-- editorconfig-checker-disable -->

```sh
cd makefile-utils
make init OUTPUT=your_project
```

or

```sh
cd makefile-utils
chmod +x $PWD/bin/makefile-utils
sudo ln -s $PWD/bin/makefile-utils /usr/local/bin/
makefile-utils init your_project
```

It will do:

1. Create 'makefile-utils' directory in your project.
2. Add `include ./makefile-utils/*.mk` to your Makefile. You can delete these files that you won't use.
3. Add `.DEFAULT_GOAL := help` to your Makefile if `.DEFAULT_GOAL` not defined in Makefile.
  - Then run `make` equals to `make help`.
  - You can skip it via `make init OUTPUT=your_project DEFAULT_TARGET=` or `makefile-utils init your_project ''`.
4. Add `/makefile-utils/*` and `!/makefile-utils/*.mk` to your .gitignore if this file existed.
5. Add `[{Makefile,*.mk}] indent_style = tab` to your .editorconfig if this file existed.

Now `cd` to your project and run `make help` to show usage.

### make help

By default, it only shows target name. Add `@desc {description}` **at the previous line of target** for printing description.

It does not print target defined with makefile functions like `$(target):`. But you can add `@target {name} {description}` in Makefile.

### make semver-*

`make semver-major` only print next major version. And also the `make semver-minor` and `make semver-patch`.

You can call the target in other targets.
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

### make CHANGELOG

To generate a CHANGELOG file and update it.

Do not run `make CHANGELOG` directly. Add below codes in your Makefile.

```sh
.PHONY: changelog
changelog:
	$(MAKE) CHANGELOG NEXT_VERSION=$(shell cat VERSION)
```

To update the CHANGELOG, just `echo "0.1.0" > VERSION` and run `make changelog`.

You can preview [the example of generated CHANGELOG](./CHANGELOG.md).
Read [the Makefile of makefile-utils](./Makefile) for reference.

You can change the output of CHANGELOG file.

```sh
.PHONY: changelog
changelog:
	$(MAKE) CHANGELOG NEXT_VERSION=0.1.0 OUTPUT=change_log.md
```

### make md5

To generate .md5 file for each files in the specified directory.

Defaults to the files in `./dist`. But you can change it by `make md5 DIST=./dist`.

### make md5-check

Checks the md5 of the file in the specified directory.

Defaults to the files in `./dist`. But you can change it by `make md5 DIST=./dist`.

### make md-check-links

Check dead links in markdown files with [lychee](https://github.com/lycheeverse/lychee).

Copy the [`lychee.toml`](./lychee.toml) to your project.

You can exclude urls by [`.lycheeignore`](https://github.com/lycheeverse/lychee#ignoring-links). [example](https://github.com/lycheeverse/lychee/blob/7e0b9e2c68118202ad75ffd3de0e113c5d5b7137/fixtures/ignore/.lycheeignore).

To avoid getting rate-limited while checking GitHub links. You can set `GITHUB_TOKEN=xxx make md-check-links`.
The github token can be generated in your [GitHub account settings page](https://github.com/settings/tokens).
A personal token with no extra permissions is enough to be able to check public repos links.

### More makefile target...

More handy makefile targets will be added later.

Welcome to talk requirements with me in [Discussion](https://github.com/adoyle-h/makefile-utils/discussions).

## Suggestion, Bug Reporting, Contributing

**Before opening new Issue/Discussion/PR and posting any comments**, please read [Contributing Guidelines](https://gcg.adoyle.me/CONTRIBUTING).

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
