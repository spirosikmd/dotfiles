black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)
bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

export EDITOR=vim
export PS1='\[$bold\]\[$black\][\[$dk_blue\]\w\[$black\]][\[$red\]$(node --version)\[$black\]]$(__git_info)$reset\$ '
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

source ~/.usabillarc

source $HOME/.bash/git-completion.bash

source $HOME/.bash/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_STATESEPARATOR="|"
GIT_PS1_SHOWUPSTREAM="auto"
__git_info() {
    local info=$(__git_ps1 | sed -E 's/\(|\)//g' | xargs)
    [[ -z $info ]] && return;
    local branch="$(echo $info | cut -d '|' -f 1)"
    local status="$(echo $info | cut -d '|' -f 2)"

    echo -n "$black[$lt_blue$status$black]"
}
