#!/bin/sh
git clone git@github.com:easytzb/vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ $SHELL = "/bin/bash" ]; then
	echo 'alias vim="vim -u ~/.vim/vimrc"'>>~/.bash_profile
elif [ $SHELL = "/bin/zsh" ]; then
	echo 'alias vim="vim -u ~/.vim/vimrc"'>>~/.zshrc
elif [ $SHELL = "/usr/local/bin/zsh" ]; then
	echo 'alias vim="vim -u ~/.vim/vimrc"'>>~/.zshrc
else 
	cp ./vimrc ~/.vimrc
fi
vim -u ~/.vim/vimrc +PluginInstall +qall
