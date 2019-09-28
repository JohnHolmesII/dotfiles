#I like my .bashrc file
. $HOME/.scripts/git-completion.bash
. $HOME/.scripts/git-prompt.sh

PS1='\[\e]0;\w\a\]'         # title bar
PS1="$PS1"'\n'              # new line
PS1="$PS1"'\[\e[36m\]'      # change to cyan
PS1="$PS1"'\u@\h '          # user@host<space>
PS1="$PS1"'\[\e[35m\]'      # change to pink
PS1="$PS1"'$SYSNAME '       # show SYSNAME
PS1="$PS1"'\[\e[33m\]'      # change to brownish yellow
PS1="$PS1"'\w'              # current working directory
PS1="$PS1"'\[\e[34m\]'	    # change color to purple
PS1="$PS1"'`__git_ps1`'	    # bash function
PS1="$PS1"'\[\e[0m\]'       # change color
PS1="$PS1"'\n'              # new line
PS1="$PS1"'$ '              # prompt: always $
export PS1

export SYSNAME=`lsb_release -is 2>/dev/null || uname -o 2>/dev/null || echo UNKOWN`
export ASAN_SYMBOLIZER_PATH=`which llvm-symbolizer 2>/dev/null`

command -v clang >/dev/null 2>&1 && export CC=clang && export CXX=clang++

if [[ $SYSNAME == "VoidLinux" ]]; then
	export XDG_RUNTIME_DIR=/var/tmp
	alias off='sudo shutdown -P'
elif [[ $SYSNAME == "Arch" ]]; then
	alias off='shutdown 0'
	alias gh='cd /media/Programs/GitHub'
	alias school='cd /media/Programs/School'
elif [[ $SYSNAME == "ManjaroLinux" ]]; then
	alias off='shutdown 0'
elif [[ $SYSNAME == "Ubuntu" ]]; then
	alias gh='cd /mnt/d/Programs/GitHub'
	alias school='cd /mnt/d/Programs/School'
	sshd_status=$(service ssh status 2>/dev/null)
	if [[ $sshd_status = *"is not running"* ]]; then
  		sudo service ssh --full-restart
	fi
elif [[ $SYSNAME == "Msys" ]]; then
	export MSYSTEM="MSYS"
	export PATH=$PATH:/mingw64/bin/
	alias gh='cd "D:\Programs\GitHub"'
	alias school='cd "D:\Programs\School"'
	CPPFLAGS=-I/mingw64/include
	LDFLAGS=-L/mingw64/lib
elif [[ $SYSNAME == "Android" ]]; then
	alias get='pkg install'
elif [[ $SYSNAME == "FreeBSD" ]]; then
	alias off='sudo shutdown'
fi

alias vlg='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes'
alias ls='ls -h --group-directories-first --color=auto'
alias grep='grep --color=auto'

