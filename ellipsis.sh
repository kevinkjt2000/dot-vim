#!/usr/bin/env bash
#
# kevinkjt2000/vim ellipsis package

pkg.install() {
  git submodule update --init --recursive
}

pkg.link() {
  fs.link_file vimrc
  mkdir -p ~/.vim/bundle
  fs.link_file vim/bundle/Vundle.vim ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
}

pkg.pull() {
  git.pull
  git submodule update --recursive --remote
  vim +PluginInstall +qall
}

