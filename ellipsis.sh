#!/usr/bin/env bash
#
# kevinkjt2000/vim ellipsis package

pkg.install() {
  git submodule update --init --recursive
  fs.link_files $PKG_PATH
  vim +PluginInstall +qall
}

pkg.pull() {
  git.pull
  git submodule update --recursive --remote
}

