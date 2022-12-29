## Paths

set HEROKU /usr/local/opt/heroku/bin
set SQLITE /usr/local/opt/sqlite/bin

set GPGAGENT /usr/local/opt/gpg-agent/bin
set OPENSSL /usr/local/opt/openssl/bin

# brew
fish_add_path /usr/local/sbin

# node.js - custom node modules folder
set -gx NPM_PACKAGES ~/.npm
set -gx NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH
fish_add_path /usr/local/opt/node@16/bin

# ruby 
fish_add_path ~/.gem/ruby/3.0.0/bin

# yarn
set icu4c_path /usr/local/opt/icu4c

# lang paths
set python_path /usr/local/opt/python@3.8/bin
set ruby_path /usr/local/opt/ruby/bin

set -gx PATH $OPENSSL $HEROKU $SQLITE $GPGAGENT /usr/local/bin $NPM_PACKAGES/bin $python_path $ruby_path $icu4c_path/bin $icu4c_path/sbin $PATH
set -gx LIBRARY_PATH $LIBRARY_PATH /usr/local/opt/openssl/lib/

## Variables

set -gx GPG_TTY (tty)

# Make neovim the default editor
set -x EDITOR nvim
alias vim=nvim

# Prefer US English and use UTF-8
set -x LANG en_US
set -x LC_ALL en_US.UTF-8

# Highlight section titles in manual pages
set -x LESS_TERMCAP_md $ORANGE

# Don’t clear the screen after quitting a manual page
set -x MANPAGER "less -X"

# Always enable colored `grep` output
set -x GREP_OPTIONS --color=auto

# Link Homebrew casks in `/Applications` rather than `~/Applications`
set -x HOMEBREW_CASK_OPTS --appdir=/Applications

## Init rbenv
status --is-interactive; and source (rbenv init -|psub)

## Aliases

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."

#  git aliases
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gs='git status'
alias gl='git log --oneline --decorate'
alias gdf='git diff --color-moved'
alias gfd='git diff --color-moved'
alias pull='git pull'
alias commit='git commit -v'
alias push='git push'
alias fpush='git push --force-with-lease'
alias ci='git commit -v'
alias glb='git branches | grep -v remote'
alias grlb='git branch | xargs git branch -d 2>/dev/null'
alias gaa='git add -A'
alias ga='git add -i -p'
alias gco='git checkout'
alias master='git checkout master'
alias main='git checkout main'
alias grm='git rebase master'
alias grc='git rebase --continue'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# ccat
# 'brew install ccat' required
alias cat="ccat"

# iA Writer
alias ia="open $1 -a /Applications/iA\ Writer.app/Contents/MacOS/iA\ Writer"

# ruby & rails
alias rails="bundle exec rails"
alias rspec="bundle exec rspec"

# python (always3)
alias python=/usr/local/bin/python3

# pdf
alias pdfMerge='"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py" -o'
