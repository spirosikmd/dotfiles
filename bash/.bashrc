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
export PS1='\[$bold\]\[$black\][\[$dk_blue\]\u\[$black\]][\[$green\]\w\[$yellow\]\[$black\]][\[$red\]$(node --version)\[$black\]]\$ '
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh

source ~/.usabillarc

source $HOME/.bash/git-completion.bash
