export LANG=en_US.UTF-8
export EDITOR=vim
export PATH="./node_modules/.bin:$PATH"

if [[ `uname` == "Darwin" ]]
then
  alias wifi_reconnect='networksetup -setairportpower en0 off; networksetup -setairportpower en0 on'
fi

if [[ `uname` == "Linux" ]]
then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

if command -v tmux >/dev/null 2>&1
then
  alias mtmux="tmux -CC new -A -s main"
fi

alias firebase.gmail="cp ~/.config/configstore/firebase-tools-gmail.json ~/.config/configstore/firebase-tools.json"
alias firebase.gourmetpro="cp ~/.config/configstore/firebase-tools-gourmetpro.json ~/.config/configstore/firebase-tools.json"
