# shellcheck shell=sh
# shellcheck disable=SC1090

SYSNAME=$(lsb_release -is 2>/dev/null || uname -o 2>/dev/null || echo UNKOWN); export SYSNAME
ASAN_SYMBOLIZER_PATH=$(command -v llvm-symbolizer 2>/dev/null); export ASAN_SYMBOLIZER_PATH

exists 'nvim'         && export EDITOR='nvim' && alias vim='nvim'
exists 'less'         && export PAGER='less'
exists 'pacman'       && export PACKAGER='pacman'
exists 'yay'          && export PACKAGER='yay'
exists 'xbps-install' && export PACKAGER='xbps'
exists 'apt'          && export PACKAGER='apt'
exists 'pkg'          && export PACKAGER='pkg'
exists 'clang'        && export CC='clang' && export CXX='clang++'

[ -d "$HOME"/.scripts ] && export PATH="$PATH":"$HOME"/.scripts
[ -f "$HOME"/.bashrc ]  && . "$HOME"/.bashrc

exists 'tinycron' && (killall tinycron 2> /dev/null; (tinycron '@hourly' backupRPCS3 &))

