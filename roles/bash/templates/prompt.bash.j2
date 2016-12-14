# .bashrc
# played by ansible

export PROMPT_COMMAND=__prompt_command

function __prompt_command()
{
    local EXIT="$?"
    PS2=""
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'
 

    #PS1
    PS1+="${RCol}${Gre}\u${RCol}@${BBlu}\h ${Pur}\w"

    local GIT_BRANCH=$(git branch 2>/dev/null | grep "^*" | colrm 1 2)
    if [ "$GIT_BRANCH" != "" ]; then
        PS1+="${Gre}[${GIT_BRANCH}]${RCol}"
    fi
    if [ $EXIT != 0 ]; then
        PS1+="${Red}(${EXIT})${RCol}"      # Add red if exit code non 0
    fi
    PS1+="\n${BYel}${RCol}$ "

    #PS2
    PS2+="${BYel}   ->"${RCol}
}

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

