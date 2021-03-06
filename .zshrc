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
bkp() {
  cp "$1"{,.bak}
}
# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# ------------------------------------------------
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}
# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
function cbf() { cat "$1" | cb; }  


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
[[ -s /home/minivan/.nvm/nvm.sh ]] && . /home/minivan/.nvm/nvm.sh # This loads NVM

