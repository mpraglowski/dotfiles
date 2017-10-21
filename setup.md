# Because I need passwords

* install dropbox
* install 1Password
  * connect 1Password to Dropbox sync & wait for my passwords

# brew
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
brew install gpg-agent pinentry-mac
# setup gpg-agent as described https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b

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
brew cask install iterm2
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

# databases
```
brew install mysql
brew services start mysql
brew install redis
brew services start redis
```

# work
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
gem install mailcatcher
cd ~/arkency/billetto && ctags -R -f .tags .
# install full XCode from AppStore
sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -license
# install JRE from http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jre-8u144-macosx-x64.dmg
# install JDK from http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-macosx-x64.dmg
# instead of brew cask install java
brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/32596089dd28f7542b44b2ff83f28e23760bf347/Formula/elasticsearch@1.7.rb
brew services start elasticsearch@1.7
gem install engineyard
cd ~/arkency/billetto && touch tmp/pids/sidekiq.pid
```
