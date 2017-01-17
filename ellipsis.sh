#!/usr/bin/env bash
#
# kevinkjt2000/vim ellipsis package

pkg.install() {
	git submodule update --init --recursive
}

pkg.link() {
	mkdir -p "$ELLIPSIS_HOME/.config/nvim/bundle"
	fs.link_file vimrc "$ELLIPSIS_HOME/.config/nvim/init.vim"
	fs.link_file plugins.vim "$ELLIPSIS_HOME/.config/nvim/plugins.vim"
	fs.link_file tabline.vim "$ELLIPSIS_HOME/.config/nvim/tabline.vim"
	fs.link_file vim/bundle/Vundle.vim "$ELLIPSIS_HOME/.config/nvim/bundle/Vundle.vim"
	nvim +PluginInstall +qall
}

pkg.links() {
	msg.bold "${1:-$PKG_NAME}"
	local files="init.vim plugins.vim tabline.vim bundle/Vundle.vim"
	for file in $files; do
		local file="$ELLIPSIS_HOME/.config/nvim/$file"
		local link="$(readlink "$file")"
		echo "$(path.relative_to_packages "$link") -> $(path.relative_to_home "$file")";
	done
}

pkg.pull() {
	git.pull
	git submodule update --recursive --remote
	nvim +PluginInstall +qall
}

