## Paths

set HEROKU /usr/local/opt/heroku/bin
set SQLITE /usr/local/opt/sqlite/bin

set GPGAGENT /usr/local/opt/gpg-agent/bin
set OPENSSL /usr/local/opt/openssl/bin

# node.js - custom node modules folder
set -gx NPM_PACKAGES ~/.npm
set -gx NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH

set -gx PATH $OPENSSL $HEROKU $SQLITE $GPGAGENT /usr/local/bin $NPM_PACKAGES/bin $PATH
set -gx LIBRARY_PATH $LIBRARY_PATH /usr/local/opt/openssl/lib/

## Variables

set -gx GPG_TTY (tty)

# Make vim the default editor
set -x EDITOR vim

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

## Aliases

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."

#  git aliases
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gs='git status'
alias gl='git log --oneline --decorate'
alias gdf='git diff'
alias gfd='git diff'
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
alias staging='git checkout staging'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# ccat
# 'brew install ccat' required
alias cat="ccat"

# iA Writer
alias ia="open $1 -a /Applications/iA\ Writer.app/Contents/MacOS/iA\ Writer"

# vim => nvim
alias vim="nvim"

# python (always3)
alias python=/usr/local/bin/python3
