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

#base utils
```
brew install ccat
brew install cmake
brew install ctags
brew install fzf
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

brew install gpg
# install keybase form https://keybase.io/docs/the_app/install_macos
brew install gnupg
brew install pinentry-mac
# setup keybase's keys to be used to sign-in git commits 
#   public key could be exported from keybase & imported into gpg: keybase pgp export -q 8782A41BD5A649B4 | gpg --import
gpg --allow-secret-key-import --import keybase.public.key
gpg --allow-secret-key-import --import keybase.private.key


brew install gist
gist login
```

# vim
```
brew install vim --with-lua --with-override-system-vi --with-python3
pip3 install --upgrade pip setuptools wheel
brew install neovim
pip2 install --user --upgrade neovim
pip3 install --user --upgrade neovim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe && ./install.py --all
```

# dotfiles
```
git clone git@github.com:mpraglowski/dotfiles.git ~/dotfiles
cd ~/dotfiles
sh bootstrap.sh
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

# moar utils
```
brew install make --with-default-names
brew install tree
brew install ack
brew install the_silver_searcher
brew install htop
brew install gnu-sed
brew install hh
brew install tldr
```

# ruby
```
brew install rbenv
brew install rbenv-gemset
brew install puma/puma/puma-dev
sudo puma-dev -setup
puma-dev -install
mkdir ~/.puma-dev
brew install heroku
brew install sqlite
```

# other dev
```
brew install erlang
brew install elixir
brew install go
brew cask install haskell-platform
```

# webdev
```
brew install yarn
brew install node@6
```

# work

## RailsEventStore
```
brew tap homebrew/cask
brew install chromedriver
```

## billetto
```
echo 3000 > ~/.puma-dev/billetto
brew install imagemagick@6
brew link --force imagemagick@6
brew install libmagic
brew install qt@5.5
brew install v8
brew tap phrase/brewed
brew install phraseapp
cd ~/arkency/billetto && ctags -R -f .tags .
gem install engineyard
cd ~/arkency/billetto && touch tmp/pids/sidekiq.pid
```
