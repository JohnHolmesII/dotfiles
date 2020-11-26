#!/usr/bin/zsh

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/hurb/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=/tmp/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd nomatch notify
unsetopt extendedglob
bindkey -v

[ -z "$PROFILE_IS_SOURCED" ] && . "$HOME/.profile"

fpath=(~/.zsh $fpath)
. "$HOME/.git-prompt.sh"

GPG_TTY=$(tty);                                        export GPG_TTY
SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket); export SSH_AUTH_SOCK

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

if [ "$SYSNAME" = "VoidLinux" ]; then
	alias off='sudo shutdown -P'
	export XDG_RUNTIME_DIR=/var/tmp
elif [ "$SYSNAME" = "Arch" ] || [ "$SYSNAME" = "Artix" ]; then
	alias gh='cd /media/Programs'
elif [ "$SYSNAME" = "Ubuntu" ]; then
	alias gh='cd /mnt/d/Programs'

	sshd_status=$(service ssh status 2>/dev/null)

	if [[ "$sshd_status" = *"is not running"* ]]; then
		sudo service ssh --full-restart >/dev/null 2>&1
	fi
elif [ "$SYSNAME" = "Msys" ]; then
	alias gh='cd "D:\Programs"'
	export MSYSTEM="MSYS"
	export PATH="$PATH":/mingw64/bin/
	export CPPFLAGS=-I/mingw64/include
	export LDFLAGS=-L/mingw64/lib
fi

alias vlg='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes'
alias grep='grep --color=auto'
alias bc='bc -sqi'
exists 'nvim' && alias vim='nvim'

if [ "$SYSNAME" != "Darwin" ]; then
	alias ls='ls -h --group-directories-first --color=auto'
fi

exists gpgconf && gpgconf --launch gpg-agent
