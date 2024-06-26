# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

### Prompt ### 
eval "$(starship init zsh)"

### asdf ###
source $(brew --prefix)/opt/asdf/libexec/asdf.sh

###  History ### 
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

###  History substring ###
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
HISTORY_SUBSTRING_SEARCH_PREFIXED=1
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

### Aliases ###
source "$HOME/.aliases"

### Functions ###
fpath=($HOME/.functions $fpath)
autoload -Uz $HOME/.functions/*(.)

### Behaviour ###
setopt autocd 
setopt glob_complete
unsetopt case_glob

### Completion ###
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  
  autoload -Uz compinit
  compinit
fi

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
