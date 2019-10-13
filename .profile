# shellcheck shell=sh
# shellcheck disable=SC1090

SYSNAME=$(lsb_release -is 2>/dev/null || uname -o 2>/dev/null || echo UNKOWN); export SYSNAME
ASAN_SYMBOLIZER_PATH=$(command -v llvm-symbolizer 2>/dev/null);                export ASAN_SYMBOLIZER_PATH
WMDIR=/afs/cats.ucsc.edu/courses/cse110a-wm;                                   export WMDIR

[ -d "$HOME/.scripts" ] && export PATH="$HOME/.scripts:$PATH"

case "$HOSTNAME" in
	unix[1-4].lt.ucsc.edu) export PATH="$WMDIR/bin:$PATH"
	export TERM=xterm
	export LANGUAGE=en_US
	export LC_ALL=en_US
	;;
esac

exists 'nvim'         && export EDITOR='nvim' && alias vim='nvim'
exists 'less'         && export PAGER='less'
exists 'pacman'       && export PACKAGER='pacman'
exists 'yay'          && export PACKAGER='yay'
exists 'xbps-install' && export PACKAGER='xbps'
exists 'apt'          && export PACKAGER='apt'
exists 'pkg'          && export PACKAGER='pkg'
exists 'clang'        && export CC='clang' && export CXX='clang++'

[ -f "$HOME/.bashrc" ]  && . "$HOME/.bashrc"

exists 'tinycron' && (killall tinycron 2> /dev/null; (tinycron '@hourly' backupRPCS3 &))

