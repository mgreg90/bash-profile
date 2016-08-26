echo "loading bash aliases..."

# Mike's bash functions
# Bash Profile
alias ab='atom ~/.bashrc'
alias abf='atom ~/bash_profile_addons/.bash_functions'
alias aba='atom ~/bash_profile_addons/.bash_aliases'
alias sb='source ~/.bashrc'

# Navigation
alias ll='ls -alF'
alias la='ls -ACF'
alias l='ls -CF'
alias d='cd'
alias b='cd ..'
alias c='clear'
alias src='cd ~/src'
alias md='mkdir -p'
alias t='touch'
alias a='atom .'
alias o='nohup' # o for open, nohup detaches command from terminal

# Git
alias gst='git status'
alias gaa='git add .'
alias ga='git add '
alias gf='git fetch'
alias gc='git commit -m '
alias gp='git push'
alias gpom='git push origin master'
alias gphm='git push heroku master'
alias gpa='git push && git push heroku master'
alias gpll='git pull'
alias ho='heroku open'

# Run Dev Server
alias rse="ruby server.rb"

# Rails
alias rl='rails logs'
# alias rs='rails server'
alias rs?='lsof -wni tcp:3000'
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

# Opening programs
alias sl='slack &>/dev/null & disown'
alias tb='thunderbird &>/dev/null & disown'
alias sp='spotify &>/dev/null & disown'
alias start='google-chrome &>/dev/null & slack &>/dev/null & thunderbird &>/dev/null & spotify &>/dev/null & disown'
alias chr='google-chrome &>/dev/null & disown'

echo "Done"
