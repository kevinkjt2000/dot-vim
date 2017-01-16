#!/usr/bin/env bash
#
# kevinkjt2000/vim ellipsis package

pkg.install() {
	git submodule update --init --recursive
}

pkg.link() {
	mkdir -p ~/.config/nvim/bundle
	fs.link_file vimrc ~/.config/nvim/init.vim
	fs.link_file plugins.vim ~/.config/nvim/plugins.vim
	fs.link_file vim/bundle/Vundle.vim ~/.config/nvim/bundle/Vundle.vim
	nvim +PluginInstall +qall
}

pkg.pull() {
	git.pull
	git submodule update --recursive --remote
	nvim +PluginInstall +qall
}

