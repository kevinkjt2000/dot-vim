#!/usr/bin/env bash
#
# kevinkjt2000/vim ellipsis package

pkg.install() {
  git submodule update --init --recursive
}

pkg.link() {
  if utils.cmd_exists nvim; then
    mkdir -p ~/.config/nvim
    fs.link_file vimrc ~/.config/nvim/init.vim
    mkdir -p ~/.config/nvim/bundle
    fs.link_file vim/bundle/Vundle.vim ~/.config/nvim/bundle/Vundle.vim
    nvim +PluginInstall +qall
  else
    fs.link_file vimrc
    mkdir -p ~/.vim/bundle
    fs.link_file vim/bundle/Vundle.vim ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
  fi
}

pkg.pull() {
  git.pull
  git submodule update --recursive --remote
  if utils.cmd_exists nvim; then
    nvim +PluginInstall +qall
  else
    vim +PluginInstall +qall
  fi
}

