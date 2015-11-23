#!/bin/sh
cp ./vimrc ~/.vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/vundle
vim +PluginInstall +qall
