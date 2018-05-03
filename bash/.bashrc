black="\[\033[40;1;30m\]"
red="\[\033[40;1;31m\]"
green="\[\033[40;1;32m\]"
yellow="\[\033[40;1;33m\]"
dk_blue="\[\033[40;1;34m\]"
pink="\[\033[40;1;35m\]"
lt_blue="\[\033[40;1;36m\]"
reset="\[\033[40;1;0m\]"

export EDITOR=vim
export PS1="$black[$dk_blue\w$black][$red$(node --version)$black]$(__git_info)$reset\$ "
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

source ~/.usabillarc

source $HOME/.bash/git-completion.bash
source $HOME/.bash/aliases.sh
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
