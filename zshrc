export ZSH=~/.oh-my-zsh
source "$ZSH/custom/zsh-git-prompt/zshrc.sh"
ZSH_THEME="robbyrussell"

plugins=()

source $ZSH/oh-my-zsh.sh

GIT_PROMPT_EXECUTABLE="haskell"
PROMPT='💁  [%c] $(git_super_status)$ '

alias g='hub'
alias git='hub'
alias ga='hub add'
alias gs='hub status && hub --no-pager diff --stat'
alias gp='hub push'
alias gc='hub commit -v'
alias gr='hub fetch && hub rebase -i origin/master'
alias gpr='hub pull-request'
alias sudo='sudo '
alias vim='nvim'
alias vi='nvim'
alias http='python -m SimpleHTTPServer 9000'
alias dcr='docker-compose run --rm '
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

export EDITOR='nvim'

delete_all_docker_shit() {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
  docker volume rm $(docker volume ls -q)
  docker images | grep -o '\S*' | xargs docker rmi
  docker images -q | xargs docker rmi
}

docker_aws() {
  eval $(aws ecr get-login --region us-east-1)
}

update_all() {
  brew update && \
    brew upgrade && \
    brew reinstall --HEAD neovim && \
    upgrade_oh_my_zsh && \
    nvim +PlugUpdate +q +q
}
