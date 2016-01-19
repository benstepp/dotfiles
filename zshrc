export ZSH=~/.oh-my-zsh
source "$ZSH/custom/zsh-git-prompt/zshrc.sh"
ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git docker)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin"
export PATH="~/.rbenv/bin:$PATH"

source $ZSH/oh-my-zsh.sh

GIT_PROMPT_EXECUTABLE="haskell"
PROMPT='[%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%{$fg[cyan]%}%c%{$reset_color%}] $(git_super_status)$ '

export PGPASSFILE='~/.pgpass'

alias rgm='rails g migration'
alias rs='rails server'
alias rc='rails console'
alias rsb="rails server -b $(ifconfig | grep -o '\s192.168.[0-9]\{1,3\}.[0-9]\{1,3\}\s')"
alias rdbm='rake db:migrate && RAILS_ENV=test rake db:migrate'
alias rdbr='rake db:rollback && RAILS_ENV=test rake db:rollback'

alias d='docker-compose run web'
alias g='hub'
alias git='hub'
alias ga='hub add'
alias ga='hub diff'
alias gs='hub status && hub --no-pager diff --stat'
alias gc='hub commit -v'
alias gr='hub fetch && hub rebase -i origin/master'
alias gpr='hub pull-request'
alias sudo='sudo '
alias vim='nvim'
alias vi='nvim'
alias http='python -m SimpleHTTPServer 9000'
alias z='cd /Volumes/Z-Drive/'

export EDITOR='nvim'

eval "$(rbenv init -)"
eval "$(docker-machine env default)"
