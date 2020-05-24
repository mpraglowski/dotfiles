# Because I need passwords

* install dropbox
* install 1Password
  * connect 1Password to Dropbox sync & wait for my passwords

# brew
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

# switch to fish shell
```
brew install fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

# utils
```
brew install ccat cmake ctags fzf tree make ack the_silver_searcher htop gnu-sed hh tldr httpie
```

# git
```
brew install git
ssh-keygen -t rsa -b 4096 -C "m@praglowski.com"
eval "$(ssh-agent -s)"
# edit ~/.ssh/config => https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
ssh-add -K ~/.ssh/id_rsa
pbcopy < ~/.ssh/id_rsa.pub
# add shh key to github

brew install gpg gnupg pinentry-mac
# install keybase form https://keybase.io/docs/the_app/install_macos
# setup keybase's keys to be used to sign-in git commits 
#   public key could be exported from keybase & imported into gpg: keybase pgp export -q 8782A41BD5A649B4 | gpg --import
gpg --allow-secret-key-import --import keybase.public.key
gpg --allow-secret-key-import --import keybase.private.key


brew install gist
gist login
```

# dotfiles
```
git clone git@github.com:mpraglowski/dotfiles.git ~/dotfiles
cd ~/dotfiles
sh bootstrap.sh
```

# vim
```
brew install python3 lua
brew install vim
pip3 install --upgrade pip setuptools wheel
pip3 install --user --upgrade neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe && ./install.py --all
```

# terminal
```
# download http://ethanschoonover.com/solarized
# download & install SourceCode Pro for Powerline from https://github.com/powerline/fonts
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
# install plugins https://github.com/tmux-plugins/tpm#installing-plugins
```


# ruby
```
brew install rbenv
brew install rbenv-gemset
brew install puma/puma/puma-dev
sudo puma-dev -setup
puma-dev -install
mkdir ~/.puma-dev
brew tap heroku/brew && brew install heroku
brew install sqlite
```

# other dev
```
brew install erlang elixir
```

# webdev
```
brew install yarn
brew install node
```

# work

## RailsEventStore
```
brew tap homebrew/cask
brew install chromedriver
```
