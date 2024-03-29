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
MOZ_ENABLE_WAYLAND=1;                                           export MOZ_ENABLE_WAYLAND
MOZ_DBUS_REMOTE=1;                                              export MOZ_DBUS_REMOTE
LSCOLORS='ExGxdxbxcxegedabagacad';                              export LSCOLORS
HISTSIZE=100000;                                                export HISTSIZE
SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket";              export SSH_AUTH_SOCK

export PATH="$HOME/.scripts:$PATH"

if [ "$SYSNAME" = "Darwin" ]; then
        PATH="/opt/local/bin:/opt/local/sbin:$PATH"; export PATH
        [ -d "/opt/local/lib/mariadb/bin" ] && PATH="/opt/local/lib/mariadb/bin:$PATH" && export PATH
fi

exists 'nvim'         && export EDITOR='nvim'
exists 'less'         && export PAGER='less'
exists 'clang'        && export CC='clang' && export CXX='clang++'

exists 'pacman'       && export PKGR='pacman'
exists 'yay'          && export PKGR='yay'
exists 'xbps-install' && export PKGR='xbps'
exists 'apt'          && export PKGR='apt'
exists 'apk'          && export PKGR='apk'
exists 'pkg'          && export PKGR='pkg'
exists 'port'         && export PKGR='port'

exists 'sv'           && export INIT='runit'
exists 'systemctl'    && export INIT='systemd'

. "$HOME/.bashrc"
