# shellcheck shell=sh
# shellcheck disable=SC1090
# shellcheck disable=SC2039

[ -n "$PROFILE_IS_SOURCED" ] && return 0
PROFILE_IS_SOURCED=true; export PROFILE_IS_SOURCED

SYSNAME=$(lsb_release -is 2>/dev/null) ||
SYSNAME=$(uname -o 2>/dev/null)        ||
SYSNAME=$(uname -s 2>/dev/null)        ||
SYSNAME=UNKNOWN
export SYSNAME

DOTNET_CLI_TELEMETRY_OPTOUT=1;                                  export DOTNET_CLI_TELEMETRY_OPTOUT
ASAN_SYMBOLIZER_PATH=$(command -v llvm-symbolizer 2>/dev/null); export ASAN_SYMBOLIZER_PATH
GIT_PS1_HIDE_IF_PWD_IGNORED=1;                                  export GIT_PS1_HIDE_IF_PWD_IGNORED
GIT_PS1_SHOWDIRTYSTATE=1;                                       export GIT_PS1_SHOWDIRTYSTATE
_JAVA_AWT_WM_NONREPARENTING=1;                                  export _JAVA_AWT_WM_NONREPARENTING

[ -d "$HOME/.scripts" ] && export PATH="$HOME/.scripts:$PATH" && HAVE_SCRIPTS=true && export HAVE_SCRIPTS

exists 'nvim'         && export EDITOR='nvim'
exists 'less'         && export PAGER='less'
exists 'clang'        && export CC='clang' && export CXX='clang++'

exists 'pacman'       && export PKGR='pacman'
exists 'yay'          && export PKGR='yay'
exists 'xbps-install' && export PKGR='xbps'
exists 'apt'          && export PKGR='apt'
exists 'apk'          && export PKGR='apk'
exists 'pkg'          && export PKGR='pkg'

exists 'sv'           && export INIT='runit'
exists 'systemctl'    && export INIT='systemd'
