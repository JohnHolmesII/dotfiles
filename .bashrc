#I like my .bashrc file
# shellcheck shell=sh
# shellcheck disable=SC1090
# shellcheck disable=SC1091

. "$HOME/.git-completion.bash"
. "$HOME/.git-prompt.sh"

SHELL=$(command -v bash || echo /bin/sh); export SHELL

PS1='\[\e]0;\w\a\]'      # Title bar shows cwd
PS1="$PS1"'\n'           # New line
PS1="$PS1"'\[\e[0;36m\]' # Change color to cyan
PS1="$PS1"'┌─'           # Fanciness
PS1="$PS1"'\[\e[1;36m\]' # Change to cyan (bright)
PS1="$PS1"'\u@\h '       # user@host<space>
PS1="$PS1"'\[\e[1;35m\]' # Change to magenta (bright)
PS1="$PS1"'$SYSNAME '    # Show SYSNAME
PS1="$PS1"'\[\e[1;32m\]' # Change to green
PS1="$PS1"'\w'           # Current working directory
PS1="$PS1"'\[\e[1;31m\]' # Change color to red (bright)
PS1="$PS1"'`__git_ps1`'  # Bash function
PS1="$PS1"'\n'           # New line
PS1="$PS1"'\[\e[0;36m\]' # Change color to cyan
PS1="$PS1"'└─'           # Fanciness
PS1="$PS1"'$ '           # Prompt: always $
PS1="$PS1"'\[\e[0m\]'    # Reset color
export PS1

. "$HOME/.xshrc"
