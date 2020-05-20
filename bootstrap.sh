#!/usr/bin/env bash
git pull origin master
ln -sFf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sFf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sFf ~/dotfiles/.npmrc ~/.npmrc
ln -sFf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sFf ~/dotfiles/.tmux.line.conf ~/.tmux.line.conf
ln -sFf ~/dotfiles/.vimrc ~/.vimrc
ln -sFf ~/dotfiles/.ctags ~/.ctags
ln -sFf ~/dotfiles/.ackrc ~/.ackrc
ln -sFf ~/dotfiles/.config ~/.config
#nvim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~./.config/nvim/init.vim
#gnupg
mkdir -p ~/.gnupg
ln -s ~/dotfiles/.gnupg/.gpg.conf ~/.gnupg/.gpg.conf
ln -s ~/dotfiles/.gnupg/.gpg-agent.conf ~/.gnupg/.gpg-agent.conf
