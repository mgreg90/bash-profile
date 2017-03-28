#!/bin/bash
echo "loading bash aliases..."

# Mike's Bash Functions
git_stash_apply() {
  git stash apply "stash^{/$1}"
}

git_stash_file() {
  # add some logic for optional naming
  git add .
  git reset HEAD "${@:2}"
  git commit -m "wip"
  git stash save "$1"
  git reset HEAD~
}

bash_text() {
  echo "first arg:"
  echo $1
  echo "remaining args:"
  echo "${@:2}"
}

# Mike's Bash Aliases

# Bash Profile
alias ab='atom ~/src/bash-profile'
alias abz='atom ~/.zshrc'
alias abf='atom ~/src/bash-profile/bash_profile_addons/.bash_functions'
alias aba='atom ~/src/bash-profile/bash_profile_addons/.bash_aliases'
alias sb='source ~/.zshrc'

# Vim bash profile
alias vb='vi ~/src/bash-profile'
alias vbz='vi ~/.zshrc'
alias vbf='vi ~/src/bash-profile/bash_profile_addons/.bash_functions'
alias vba='vi ~/src/bash-profile/bash_profile_addons/.bash_aliases'

# Navigation
alias ll='ls -alF'
alias la='ls -ACF'
alias l='ls -CF'
alias d='cd'
alias b='cd ..'
alias c='clear'
alias src='cd ~/src'
alias cc='cd ~/src/cc'
alias node_mod='cd /usr/local/lib/node_modules'
alias nm='cd /usr/local/lib/node_modules'
alias md='mkdir -p'
alias t='touch'

# Atom
alias a='atom .'

# Git
alias g='git'
alias gst='git status'
alias gaa='git add .'
alias ga='git add'
alias gf='git fetch'
alias gcm='git commit -m '
alias gc='git commit -eF .commit-msg.txt'
alias gca='git commit --amend'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gphm='git push heroku master'
alias gpma='git push origin master && git push heroku master'
alias gpll='git pull'
alias ho='heroku open'
alias glg='git log'
alias gls='git log --oneline'
alias gd='git diff'
alias gco='git checkout'
alias gri='git rebase -i'
alias gsf='git_stash_file'
alias gss='git stash save'
alias gsa='git_stash_apply'
alias gsl='git stash list'
alias gsd='git stash drop'
alias gsp='git stash pop'


# Run Dev Server
alias rse="ruby server.rb"

# Rails
alias rl='rails logs'
alias rs='rails server'
alias rc='rails console'
alias rdd='rake db:drop'
alias rdc='rake db:create'
alias rdm='rake db:migrate'
alias rds='rake db:seed'
alias rr='rake routes'
alias rdr='rake db:drop db:create db:migrate db:seed'
alias bi='bundle install'

# Heroku
alias hl='heroku logs'
alias hrdr='heroku run rake db:drop db:create db:migrate db:seed'
alias hrrc='heroku run rails c'
alias hrrdm='heroku run rake db:migrate'

# CareCloud
alias ru='bundle exec rackup'
alias rup='bundle exec rackup -p'
alias be='bundle exec'
alias zs='zeus s'
alias zt='zeus test'
alias zst='zeus start'
alias rsp='bundle exec rspec'

# Opening programs
alias sl='slack'
alias sp='spotify'
alias chr='chrome'
alias pm='postman'
alias ml='mail'
alias start='chrome & slack & spotify & mail'
# alias py='python3 ~/src/pymodoro/pymodoro.py'

echo "Done"
