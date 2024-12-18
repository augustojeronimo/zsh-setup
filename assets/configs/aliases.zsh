# - - - - - - - - aliases settings - - - - - - - - #

alias aliases='cat ~/.oh-my-zsh/custom/aliases.zsh'
alias aliasconf='nano ~/.oh-my-zsh/custom/aliases.zsh'
alias aliasup='source ~/.oh-my-zsh/custom/aliases.zsh'


# - - - - - - - - overwrite - - - - - - - - #

# cp in verbose mode
alias cp='cp -v'

# - - - - - - - - abbrreviation - - - - - - - - #

alias c='clear'
alias x='exit'

alias up='sudo apt update -y && sudo apt upgrade -y'
alias hgrep='history | grep'
alias pgrep="sudo netstat -tulanp | grep"

# ports number on activity
alias ports='sudo netstat -tulanp'

# size of files on actual directory
alias filesize='du -sh * | sort -h'

# - - - - - - - - with dependencies - - - - - - - - #

# simplify batcat
alias bat='batcat'

