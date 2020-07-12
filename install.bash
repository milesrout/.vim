mkdir -p "$XDG_CONFIG_HOME"
if [ ! -e "$XDG_CONFIG_HOME/vim" ]; then
	ln -s "$DOTFILES/vim" "$XDG_CONFIG_HOME/vim"
fi
mkdir -p "$XDG_DATA_HOME/vim/"{undo,swap,backup,view}

dotfiles_addlines vim ~/.bash_profile <<'HERE'
export EDITOR=vim
export VISUAL=vim
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
HERE
