#/bin/bash

__ps1_main() {
    export PS1="$black[$dk_blue\w$black][$red$(node --version)$black]$(__git_info)$reset\$ "
}
export PROMPT_COMMAND=__ps1_main

export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

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

black="\[\033[40;1;30m\]"
red="\[\033[40;1;31m\]"
green="\[\033[40;1;32m\]"
yellow="\[\033[40;1;33m\]"
dk_blue="\[\033[40;1;34m\]"
pink="\[\033[40;1;35m\]"
lt_blue="\[\033[40;1;36m\]"
reset="\[\033[40;1;0m\]"

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
