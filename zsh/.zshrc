bindkey -v
bindkey '^r' history-incremental-search-backward
bindkey '^R' history-incremental-pattern-search-backward

autoload -U colors && colors

__ps1_main() {
    export PS1="[%{$fg[green]%}%~%{$reset_color%}][%{$fg[red]%}$(node --version)%{$reset_color%}]$(__git_info)%{$reset_color%} "
}
export PROMPT_COMMAND=__ps1_main

precmd() { eval "$PROMPT_COMMAND" }

export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

# source $HOME/.zsh/git-completion.zsh
source $HOME/.zsh/aliases.sh
source $HOME/.zsh/git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_STATESEPARATOR="|"
GIT_PS1_SHOWUPSTREAM="auto"
__git_info() {
    local info=$(__git_ps1 | sed -E 's/\(|\)//g' | xargs)
    [[ -z $info ]] && return;
    local branch="$(echo $info | cut -d '|' -f 1)"
    local current_status="$(echo $info | cut -d '|' -f 2)"

    echo -n "[%{$fg[blue]%}$current_status%{$reset_color%}]"
}

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=999999999
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTSIZE
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
# PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

eval "$(rbenv init -)"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/spyros/.sdkman"
[[ -s "/Users/spyros/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/spyros/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export WEBUILD_BASIC_AUTH="dHJhdmlzOldsVEpiTElNcW9UMTdlUUFRREtRaHRHT2Z0RE41bGpNU0pCRUF1Rzl2U0xNZXZ3ZEJtWlY1VTFtNEUxSENYOU0="
