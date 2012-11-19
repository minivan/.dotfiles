# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miloshadzic"

alias r=rails
plugins=(git debian rails3 mercurial)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

alias heroku="/usr/local/heroku/bin/heroku"
alias tmux="TERM=screen-256color-bce tmux"

ff () {
  find | xargs grep "$1" -sl | view - -c "/$1/"
}
fa () {
  find app/models app/controllers | xargs grep "$1" -sl | view - -c "/$1/";
}
fs () {
  find features/ spec/ | xargs grep "$1" -sl | view - -c "/$1/";
}
fd () {
  find db/ | xargs grep "$1" -sl | view - -c "/$1/";
}
fv () {
  find app/views/ | xargs grep "$1" -sl | view - -c "/$1/";
}



### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
