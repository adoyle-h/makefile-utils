# Makefile 小工具

用一系列 makefile target 来增加你的 Makefile。

如果你不想在项目中引入 `cmake`, `xmake`, `mmake`, `emake` 等高级的 make 工具，仅使用系统自带的 `make` 命令。
makefile-utils 能帮上一点小忙。

[English](./README.md) | [中文](./README.zh.md)

## Feature

![make-help.png](https://media.githubusercontent.com/media/adoyle-h/_imgs/master/github/makefile-utils/make-help.png)

## 版本

版本详见 [tags][]。
版本命名遵守 [Semantic Versioning 2.0.0](http://semver.org/spec/v2.0.0.html)。

## 安装

你可以用 `curl` 或者 `git` 安装它。

### Curl

```sh
VERSION=v0.1.0
curl -LO "https://github.com/adoyle-h/makefile-utils/releases/download/$VERSION/makefile-utils.tgz{,.md5}"

# 检查文件完整性
md5sum -c ./*.md5

tar -xzf ./makefile-utils.tgz
```

### Git

```sh
VERSION=v0.1.0
git clone --depth 1 --branch "$VERSION" https://github.com/adoyle-h/makefile-utils.git
```

## 使用
<!-- editorconfig-checker-disable -->

```sh
cp -r makefile-utils $your_project

printf '\ninclude ./makefile-utils/*.mk\n' >> $your_project/Makefile

# 或者只加载 help makefile
# printf '\ninclude ./makefile-utils/help.mk\n' >> $your_project/Makefile

# git 需要忽略某些文件
printf '\n/makefile-utils/*\n!/makefile-utils/*.mk\n' >> $your_project/.gitignore

# 你可以把 `help` 设置为默认 target. （如果你不需要可以跳过）
printf '\n.DEFAULT_GOAL := help\n' >> $your_project/Makefile

# 查看帮助
make help
```

### make help

默认情况下它只显示 target 名字。**在 target 上一行**增加 `@desc {description}` 来打印 target 的描述。

它不会打印用 makefile 函数定义的 target，比如 `$(target):`。但你可以在 makefile 里添加 `@target {name} {description}`。

### make semver-*

`make semver-major` 只打印下一个 major 版本号。你可以在某个 target 中调用这个 target。

比如，替换 README 文件里的 `VERSION=v...`。

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

### make md5

可以给指定目录里的每个文件生成.md5 文件。

默认目录是 `./dist`。但你可以指定其他目录 `make md5 DIST=./dist`。

### make md5-check

校验指定目录下的文件的 md5。

默认目录是 `./dist`。但你可以指定其他目录 `make md5-check DIST=./dist`。

### 更多 makefile target...

后续会补充更多方便的 makefile target。

欢迎在 [Discussion](https://github.com/adoyle-h/makefile-utils/discussions) 中与我讨论需求。

## 提建议，修 Bug，做贡献

**在创建新的 Issue/Discussion/PR，以及发表评论之前**，请先阅读[贡献指南](https://gcg.adoyle.me/CONTRIBUTING.zh).

对于未翻译的文档，推荐使用 [DeepL 翻译器](https://www.deepl.com/translator)阅读。

## 版权声明

Copyright 2023 ADoyle (adoyle.h@gmail.com). Some Rights Reserved.
The project is licensed under the **Apache License Version 2.0**.

See the [LICENSE][] file for the specific language governing permissions and limitations under the License.

See the [NOTICE][] file distributed with this work for additional information regarding copyright ownership.

## 其他项目

- 我创建的[其他 shell 项目](https://github.com/adoyle-h?tab=repositories&q=&type=source&language=shell&sort=stargazers)。


<!-- links -->

[tags]: https://github.com/adoyle-h/makefile-utils/tags
[LICENSE]: ./LICENSE
[NOTICE]: ./NOTICE