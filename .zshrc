zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

HISTFILE="$HOME/.zsh/zsh_history"
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch notify
unsetopt extendedglob

bindkey -v
bindkey '\e[3~' delete-char
bindkey '\e'    self-insert
bindkey '\e[C'  forward-char
bindkey '\e[D'  backward-char
bindkey '^?'    backward-delete-char
bindkey '\e[P'  delete-char
bindkey '\e[H'  beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '^R'    history-incremental-search-backward

[ -z "$PROFILE_IS_SOURCED" ] && . "$HOME/.profile"

fpath=(~/.zsh $fpath)
. "$HOME/.git-prompt.sh"

setopt PROMPT_SUBST                 # Enable prompt expansion/calls
PS1=$'\e]0;[%l] %~\a'               # Set title bar to tty and cwd
PS1="$PS1"$'\n'                     # New line
PS1="$PS1"$'\e[1;36m'               # Change to cyan (bright)
PS1="$PS1"'%n@%m '                  # user@host<space>
PS1="$PS1"$'\e[1;35m'               # Change to magenta (bright)
PS1="$PS1$SYSNAME "                 # Show SYSNAME
PS1="$PS1"$'\e[1;32m'               # Change to green
PS1="$PS1%~"                        # Current working directory
PS1="$PS1"$'\e[1;31m'               # Change color to red (bright)
PS1="$PS1"'$(__git_ps1 " (%s)")'    # Git function
PS1="$PS1"$'\e[0m'                  # Reset color
PS1="$PS1"$'\n'                     # New line
PS1="$PS1$ "                        # Prompt: always $
export PS1

. "$HOME/.xshrc"
