#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master
function doIt() {
  ln -sFf ~/dotfiles/.aliases ~/.aliases
  ln -sFf ~/dotfiles/.bash_profile ~/.bash_profile
  ln -sFf ~/dotfiles/.bash_prompt ~/.bash_prompt
  ln -sFf ~/dotfiles/.bashrc ~/.bashrc
  ln -sFf ~/dotfiles/.exports ~/.exports
  ln -sFf ~/dotfiles/.functions ~/.functions
  ln -sFf ~/dotfiles/.git_completion ~/.git_completion
  ln -sFf ~/dotfiles/.git_prompt ~/.git_prompt
  ln -sFf ~/dotfiles/.gitconfig ~/.gitconfig
  ln -sFf ~/dotfiles/.gitignore_global ~/.gitignore_global
  ln -sFf ~/dotfiles/.inputrc ~/.inputrc
  ln -sFf ~/dotfiles/.npmrc ~/.npmrc
  ln -sFf ~/dotfiles/.path ~/.path
  ln -sFf ~/dotfiles/.screenrc ~/.screenrc
  ln -sFf ~/dotfiles/.tmux.cong ~/.tmux.conf
  ln -sFf ~/dotfiles/sublime/User/ ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
  source ~/.bash_profile
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt
  fi
fi
unset doIt
