exists()
{
	which $1 >/dev/null 2>&1
}

exists nvim         && export EDITOR=nvim && alias vim='nvim'
exists more         && export PAGER=more
exists pacman       && export PACKAGER=pacman
exists xbps-install && export PACKAGER=xbps
exists apt          && export PACKAGER=apt
exists pkg          && export PACKAGER=pkg

[ -d $HOME/.scripts ] && export PATH=$PATH:$HOME/.scripts
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

