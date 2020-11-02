#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# rbenv
eval "$(rbenv init -)"

# Customize to your needs...

# alias
alias g=git
alias gbd="git branch --merged master | grep -vE '^\*|master$|develop$' | xargs -I % git branch -d %"

#tmux
if [[ ! -n $TMUX ]]; then
  tmux new-session
fi
