exists 'nvim'         && export EDITOR='nvim' && alias vim='nvim'
exists 'less'         && export PAGER='less'
exists 'pacman'       && export PACKAGER='pacman'
exists 'yay'          && export PACKAGER='yay'
exists 'xbps-install' && export PACKAGER='xbps'
exists 'apt'          && export PACKAGER='apt'
exists 'pkg'          && export PACKAGER='pkg'

[ -d $HOME/.scripts ] && export PATH=$PATH:$HOME/.scripts
[ -f $HOME/.bashrc ]  && . $HOME/.bashrc

exists 'tinycron' && (killall tinycron 2> /dev/null; (tinycron '@hourly' backupRPCS3 &))

