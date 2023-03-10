# Changelog

All notable changes to this project will be documented in this file.

The format is inspired by [Keep a Changelog 1.0.0](https://keepachangelog.com/en/1.0.0/).

The versions follow the rules of [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

[Full Changes](https://github.com/adoyle-h/makefile-utils/compare/v0.4.1...HEAD)


<a name="v0.4.1"></a>
## v0.4.1 (2023-02-26 19:14:48 +08:00)

[Full Changes](https://github.com/adoyle-h/makefile-utils/compare/v0.4.0...v0.4.1)

### Bug Fixes

- OUTPUT can be relative path for bin/makefile-utils ([943b6ef](https://github.com/adoyle-h/makefile-utils/commit/943b6ef33eed111546c91bd6bd477b0a352faf78))


<a name="v0.4.0"></a>
## v0.4.0 (2023-02-26 19:01:16 +08:00)

[Full Changes](https://github.com/adoyle-h/makefile-utils/compare/v0.3.0...v0.4.0)

### Breaking Changes

Have 1 breaking changes. Check below logs with ⚠️ .

### New Features

- add "make init" && add bin/makefile-utils ([d953926](https://github.com/adoyle-h/makefile-utils/commit/d953926601437b0cbc3523014f651f5e900946c4))

### Bug Fixes

- ⚠️  **md-check-links**: remove LYCHEE_OPTS && support GITHUB_TOKEN ([712ad61](https://github.com/adoyle-h/makefile-utils/commit/712ad61e5909bcdf88df551aa72fb9c2d2405550))
  > You should use lychee.toml and .lycheeignore files.
  > 
  > Breaking Change:
  > 
  > - LYCHEE_OPTS not supported
- **md-check-links**: use --exclude-path not --exclude && add --exclude-all-private option ([e45a03b](https://github.com/adoyle-h/makefile-utils/commit/e45a03beccd99b0da418c14d0d12faa7c848c4d1))

### Document Changes

- update usages ([7b50542](https://github.com/adoyle-h/makefile-utils/commit/7b505425d9c835f1d194b5820d62cb0ee68dcfe1))
- update md-check-links usage ([0fac6c8](https://github.com/adoyle-h/makefile-utils/commit/0fac6c8a0c2bfcdfe894cc2194d858253e205cc1))


<a name="v0.3.0"></a>
## v0.3.0 (2023-02-24 09:47:52 +08:00)

[Full Changes](https://github.com/adoyle-h/makefile-utils/compare/v0.2.0...v0.3.0)

### New Features

- add target "md-check-links" ([d3d9221](https://github.com/adoyle-h/makefile-utils/commit/d3d922164838f1e2743beda91e53a2da5708dbb0))

### Bug Fixes

- **changelog**: change the changelog template ([1f73805](https://github.com/adoyle-h/makefile-utils/commit/1f738054bcc99cdbb2386e5c818a0ee2be112af1))

### Document Changes

- bump version v0.3.0 && update CHANGELOG ([4103430](https://github.com/adoyle-h/makefile-utils/commit/4103430a190fa4b12d0e71d563bd3a10665fe538))
- update the usage ([b449a0a](https://github.com/adoyle-h/makefile-utils/commit/b449a0a3ee13b8e762fc72eecfd9645b5e2e9112))
- add contributing ([ab3b2da](https://github.com/adoyle-h/makefile-utils/commit/ab3b2da2be2df169ca65695d17131d30fda6d278))
- update README ([bef9531](https://github.com/adoyle-h/makefile-utils/commit/bef953144d056f451ad4b517d96a76c2c513035b))


<a name="v0.2.0"></a>
## v0.2.0 (2023-02-22 23:08:58 +08:00)

[Full Changes](https://github.com/adoyle-h/makefile-utils/compare/v0.1.0...v0.2.0)

### New Features

- add target "make CHANGELOG NEXT_VERSION=0.0.0" ([11d6acb](https://github.com/adoyle-h/makefile-utils/commit/11d6acb20421af1ed2917cc1203140de022dbeae))
- **help**: support [@hide](https://github.com/hide) to hide the target ([11c187a](https://github.com/adoyle-h/makefile-utils/commit/11c187a16e7b0362392fc3afa0480981fcbd7172))

### Bug Fixes

- **help**: ignore variable assignment like "var:=value" ([2d4836c](https://github.com/adoyle-h/makefile-utils/commit/2d4836c40e15db533aa66dc6e270ef018632eeea))
- **help**: ignore special builtin targets ([946da3c](https://github.com/adoyle-h/makefile-utils/commit/946da3c71135206ea31302c0999b2bfcdc11ac86))
- **help**: target matching regex should contain "/" and "." && ignore .PHONY target ([bc2c9fc](https://github.com/adoyle-h/makefile-utils/commit/bc2c9fcb26c85bcfd081aaad6fb576b13459fb4d))
- **semver**: fetch git tag should filter with "v*.*.*" && add target: GIT_VERSION ([7ce8d50](https://github.com/adoyle-h/makefile-utils/commit/7ce8d507a1eee868ee2ef1032e0718837282d53f))
  > - remove target scope variables
  > - do not use target scope variables in ifeq

### Document Changes

- update README ([595e32d](https://github.com/adoyle-h/makefile-utils/commit/595e32d340f9032a0747295561c96f19f4cda480))
- update README ([dc32614](https://github.com/adoyle-h/makefile-utils/commit/dc32614eae73069add90ed35285e4741c0df0fad))
- add Chinese ([7f814a0](https://github.com/adoyle-h/makefile-utils/commit/7f814a06adfc611ed491fb2c774ee0da4d3fb213))

<a name="v0.1.0"></a>
## v0.1.0 (2023-02-20 21:25:26 +08:00)

