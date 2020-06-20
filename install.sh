mkdir -p ~/.config
if [ ! -e ~/.config/vim ]; then
	ln -s ~/dotfiles/vim ~/.config/vim
fi
mkdir -p ~/.config/vim/tmp

dotfiles_addlines vim ~/.bash_profile <<'HERE'
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
HERE

dotfiles_addlines vim ~/.bashrc <<'HERE'
#alias vim="vim -u ~/.config/vim/vimrc"
HERE
