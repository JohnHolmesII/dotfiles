# shellcheck shell=sh
# shellcheck disable=SC1090
# shellcheck disable=SC2039

SYSNAME=$(lsb_release -is 2>/dev/null) ||
SYSNAME=$(uname -o 2>/dev/null)        ||
SYSNAME=$(uname -s 2>/dev/null)        ||
SYSNAME=UNKNOWN
export SYSNAME

GPG_TTY=$(tty);                                                 export GPG_TTY
DOTNET_CLI_TELEMETRY_OPTOUT=1;                                  export DOTNET_CLI_TELEMETRY_OPTOUT
ASAN_SYMBOLIZER_PATH=$(command -v llvm-symbolizer 2>/dev/null); export ASAN_SYMBOLIZER_PATH

[ -d "$HOME/.scripts" ] && export PATH="$HOME/.scripts:$PATH"

if [ -n "$HOSTNAME" ]; then
    case "$HOSTNAME" in
        unix[1-4].lt.ucsc.edu) export WMDIR=/afs/cats.ucsc.edu/courses/cse110a-wm
        export PATH="$WMDIR/bin:$PATH"
        export TERM=xterm
        export LANGUAGE=en_US
        export LC_ALL=en_US
        ;;
        nog*) aklog
        export LANGUAGE=en_US
        export LC_ALL=en_US.UTF-8
        ;;
    esac
fi

exists 'nvim'         && export EDITOR='nvim' && alias vim='nvim'
exists 'less'         && export PAGER='less'
exists 'clang'        && export CC='clang' && export CXX='clang++'

exists 'pacman'       && export PKGR='pacman'
exists 'yay'          && export PKGR='yay'
exists 'xbps-install' && export PKGR='xbps'
exists 'apt'          && export PKGR='apt'
exists 'pkg'          && export PKGR='pkg'

exists 'sv'           && export INIT='runit'
exists 'systemctl'    && export INIT='systemd'

[ -f "$HOME/.bashrc" ]  && . "$HOME/.bashrc"

exists 'tinycron' && (killall tinycron 2> /dev/null; (tinycron '@hourly' backupRPCS3 &))
