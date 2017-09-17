#!/usr/bin/env bash
#
# kevinkjt2000/vim ellipsis package

VIM_ROOT="$ELLIPSIS_HOME/.config/nvim"

pkg.install() {
	git submodule update --init --recursive
}

pkg.link() {
	mkdir -p "$VIM_ROOT/bundle"
	ELLIPSIS_HOME="$VIM_ROOT"
	fs.link_rfile init.vim
	fs.link_rfile plugins.vim
	fs.link_file vim/bundle/Vundle.vim "$VIM_ROOT/bundle/Vundle.vim"
	nvim +PluginClean! +PluginInstall +GoInstallBinaries +qall
	update_ycm
}

pkg.links() {
	msg.bold "${1:-$PKG_NAME}"
	local files="init.vim plugins.vim bundle/Vundle.vim"
	for file in $files; do
		local file="$VIM_ROOT/$file"
		local link="$(readlink "$file")"
		echo "$(path.relative_to_packages "$link") -> $(path.relative_to_home "$file")";
	done
}

pkg.pull() {
	git.pull
	git submodule update --recursive --remote
	nvim +PluginClean! +PluginInstall +PluginUpdate +GoInstallBinaries +qall
	update_ycm
}

update_ycm() {
	"$VIM_ROOT/bundle/YouCompleteMe/install.py" --clang-completer --racer-completer --system-libclang --system-boost --gocode-completer
}

