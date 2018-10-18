# Archlinux Ultimate Install - .bashrc
# by helmuthdu
## OVERALL CONDITIONALS {{{
_islinux=false
[[ "$(uname -s)" =~ Linux|GNU|GNU/* ]] && _islinux=true

_isarch=false
[[ -f /etc/arch-release ]] && _isarch=true

_isxrunning=false
[[ -n "$DISPLAY" ]] && _isxrunning=true

_isroot=false
[[ $UID -eq 0 ]] && _isroot=true
# }}}
## PS1 CONFIG {{{
  [[ -f $HOME/.dircolors ]] && eval $(dircolors -b $HOME/.dircolors)
  if $_isxrunning; then

    [[ -f $HOME/.dircolors_256 ]] && eval $(dircolors -b $HOME/.dircolors_256)

    # export TERM='xterm-256color'
    export TERM='screen-256color'

    # for enabling 256 color, as per http://vim.wikia.com/wiki/256_colors_in_vim
    # if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        # export TERM='xterm-256color'
    # else
        # export TERM='xterm-color'
    # fi

     B='\[\e[1;38;5;33m\]'
    LB='\[\e[1;38;5;81m\]'
    GY='\[\e[1;38;5;242m\]'
     G='\[\e[1;38;5;82m\]'
     P='\[\e[1;38;5;161m\]'
    PP='\[\e[1;38;5;93m\]'
     R='\[\e[1;38;5;196m\]'
     Y='\[\e[1;38;5;214m\]'
     W='\[\e[0m\]'

    # get_prompt_symbol() {
      # [[ $UID == 0 ]] && echo "#" || echo "\$"
    # }

    # if [[ $PS1 && -f /usr/share/git/git-prompt.sh ]]; then
      # source /usr/share/git/completion/git-completion.bash
      # source /usr/share/git/git-prompt.sh

      # export GIT_PS1_SHOWDIRTYSTATE=1
      # export GIT_PS1_SHOWSTASHSTATE=1
      # export GIT_PS1_SHOWUNTRACKEDFILES=0

      # export PS1="$GY[$Y\u$GY@$P\h$GY:$B\W\$(__git_ps1 \"$GY|$LB%s\")$GY]$W\$(get_prompt_symbol) "
      export PS1="$GY[$Y\t$GY:$LB\w$GY]$W\$ "
      export LS_COLORS="di=00;34:ow=00;97;41:ex=01;31:ln=04;32:or=05;31:*.py=32:*.rb=100:*.php=37:*.html=04;94:*.js=00;96:*.css=00;96:*.sass=00;96:*.scss=00;96:*.gitignore=04;31:*.gitmodules=04;31:*.gitattributes=04;31:*.localized=04;31:*.rbenv-version=04;31:*.rvmrc=04;31:*.nanorc=04;31:*.htoprc=04;31:*.netrc=04;31:*.md=30;106:*.markdown=30;106:*.DS_Store=07:*.tar=04;32:*.tgz=04;32:*.zip=04;32:*.rar=04;32:*.sfv=04;32:*.jpg=01;34;40:*.png=01;34;40:*.gif=01;34;40:*.mkv=01;34;44:*.avi=01;34;44:*.mov=01;34;44:*.mp4=01;34;44:*.flv=01;34;44:*.pdf=04;33:*.txt=37:*.csv=37:*.json=37:*.sh=37;40:*.bash_history=00;90:*.gdb_history=00;90:*.irb_history=00;90:*.mysql_history=00;90:*.php_history=00;90:*.psql_history=00;90:*.lesshst=00;90"
    # else
    # [user@host:rel_path] \$:
      # export PS1="$GY[$Y\u$GY@$P\h$GY:$B\w$GY]$W \$(get_prompt_symbol) "
    # fi
  # else
    # export TERM='xterm-color'
  fi
#}}}
## TMUX CONFIG#{{{
    # If not running interactively, do not do anything
    # [[ $- != *i* ]] && return
    # [[ -z "$TMUX" ]] && exec tmux
    #}}}
## BASH OPTIONS {{{
  shopt -s cdspell                 # Correct cd typos
  shopt -s checkwinsize            # Update windows size on command
  shopt -s histappend              # Append History instead of overwriting file
  shopt -s cmdhist                 # Bash attempts to save all lines of a multiple-line command in the same history entry
  shopt -s extglob                 # Extended pattern
  shopt -s no_empty_cmd_completion # No empty completion
  ## COMPLETION #{{{
    complete -cf sudo
    if [[ -f /etc/bash_completion ]]; then
      . /etc/bash_completion
    fi
  #}}}
  bind -m vi-command ".":insert-last-argument
  bind -m vi-insert "\C-l.":clear-screen
  # bind -m vi-insert "\C-a.":beginning-of-line
  # bind -m vi-insert "\C-e.":end-of-line
  # bind -m vi-insert "\C-w.":backward-kill-word
  #}}}
## EXPORTS {{{
  export PATH=/usr/local/bin:$PATH
  export PATH=~/scripts:$PATH
  export PATH=~/bin:$PATH
  #Ruby support
  if which ruby &>/dev/null; then
    GEM_DIR=$(ruby -r rubygems -e 'puts Gem.user_dir')/bin
    if [[ -d "$GEM_DIR" ]]; then
      export PATH=$GEM_DIR:$PATH
    fi
  fi
  if [[ -d "$HOME/bin" ]] ; then
      PATH="$HOME/bin:$PATH"
  fi
  if which google-chrome-stable &>/dev/null; then
    export CHROME_BIN=/usr/bin/google-chrome-stable
  fi
  ## EDITOR #{{{
    if which vim &>/dev/null; then
      export EDITOR="vim"
    elif which emacs &>/dev/null; then
      export EDITOR="emacs -nw"
    else
      export EDITOR="nano"
    fi
  #}}}
  ## BASH HISTORY #{{{
    # make multiple shells share the same history file
    export HISTSIZE=1000            # bash history will save N commands
    export HISTFILESIZE=${HISTSIZE} # bash will remember N commands
    export HISTCONTROL=ignoreboth   # ingore duplicates and spaces
    export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'
  #}}}
  ## COLORED MANUAL PAGES #{{{
    # @see http://www.tuxarena.com/?p=508
    # For colourful man pages (CLUG-Wiki style)
    if $_isxrunning; then
      export PAGER=less
      export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
      export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
      export LESS_TERMCAP_me=$'\E[0m'           # end mode
      export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
      export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
      export LESS_TERMCAP_ue=$'\E[0m'           # end underline
      export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
    fi
  #}}}
#}}}
## ALIAS {{{
  alias freemem='sudo /sbin/sysctl -w vm.drop_caches=3'
  alias enter_matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'
  # GIT_OR_HUB {{{
    if which hub &>/dev/null; then
      alias git=hub
    fi
  #}}}
  # GIT ALIASES {{{
    alias gs='git status'
    alias gc='git commit'
    alias gsh='git show'
    alias glo='git log'
    alias ga='git add'
    alias gc='git commit'
    alias gd='git diff'
    alias gp='git push'
    alias gl='git pull'
  # }}}
  # AUTOCOLOR {{{
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
  #}}}
  # MODIFIED COMMANDS {{{
    alias cd-='cd -'
    alias cd.='cd ..'
    alias cd..='cd ../..'
    alias cd...='cd ../../..'
    alias cd....='cd ../../../..'
    alias cd.....='cd ../../../../..'
    alias cd......='cd ../../../../../..'
    alias cd.......='cd ../../../../../../..'
    alias cd........='cd ../../../../../../../..'
    alias cd.........='cd ../../../../../../../../..'
    alias cd..........='cd ../../../../../../../../../..'
    alias cd...........='cd ../../../../../../../../../../..'
    alias diff='colordiff'              # requires colordiff package
    alias du='du -c -h'
    alias e='exit'
    alias free='free -m'                # show sizes in MB
    alias mkdir='mkdir -p -v'
    alias ping='ping -c 5'
    alias hbrc='vim ~/.bashrc'
    alias hbrcl='vim ~/.dotfiles/.bashrc-local'
    alias hbrcw='vim ~/.dotfiles/.bashrc-work'
    alias hbrch='vim ~/.dotfiles/.bashrc-home'
    alias trc='vim ~/.dotfiles/tmux_config/tmux.conf'
    alias d='cd ~/Projects/Docker'
    alias s='cd ~/Projects/Scala'
    alias scr='cd ~/scripts'
    alias sd='cd /home/skramer/sd/'
    alias pdf='cd /home/skramer/PDFs/'
    alias m='make'
    alias mc='make clean'
    alias mu='cd ~/Music/'
    alias yt='cd ~/Music/Music/YT'
    alias ij='/opt/idea-IC/bin/idea.sh &'
    alias wild='/home/skramer/Downloads/wildfly-9.0.2.Final/bin/standalone.sh -c standalone-full.xml --debug &'
  #}}}
  # COMPILATION {{{
    alias c++='clang++ -Wall -o '
    alias c+='clang++ -Wall -std=c++14 -o '
    alias ghc='ghc -outputdir /tmp/ '
  #}}}
  # LOCALIZATION SHORTCUTS {{{
    alias hbrc='vim ~/.bashrc'
    alias ivrc='vim ~/.ideavimrc'
    alias vrc='vim ~/.vimrc'
    alias vrcs='vim ~/.vim/settings.vim'
    alias vrcb='vim ~/.vim/bundles.vim'
    alias vrcp='vim ~/.vim/plugins.vim'
    alias vrcm='vim ~/.vim/map.vim'
    alias vrcf='vim ~/.vim/functions.vim'
    alias vrca='vim ~/.vim/autocmd.vim'
    alias b='cd ~/builds'
    alias c='cd ~/Projects/Cpp/c_test'
    alias cl='cd ~/Projects/Cpp/ClionProjects'
    alias h='cd ~/Projects/Haskell/haskel_test'
    alias j='cd ~/Projects/Java/java_test/'
    alias s='cd ~/Projects/Scala/'
    alias psm='cd ~/Projects/psm/contract'
    alias dot='cd ~/.dotfiles'
    alias tip='cd ~/tips'
    alias p='cd ~/Projects/Python/python_test'
    alias k='cd ~/Projects/Kotlin/kotlin_test'
  #}}}
  # PRIVILEGED ACCESS {{{
    if ! $_isroot; then
      alias sudo='sudo '
      alias scat='sudo cat'
      alias svim='sudo vim'
      alias root='sudo su'
      alias reboot='sudo reboot'
      alias halt='sudo halt'
    fi
  #}}}
  # IJ {{{
    alias fixIntelliJKeyboardFreeze='ibus-daemon -rd'
  #}}}
  # LS {{{
    alias ls='ls -F --color=auto'
    alias l='ls'
    alias lr='ls -R'                    # recursive ls
    alias ll='ls -l'
    alias lla='ls -al'
    alias la='ls -A'
    alias lm='la | less'

  #}}}
  # SYSTEMD SUPPORT {{{	
        if which systemctl &>/dev/null; then	
          start() {	
            sudo systemctl start $1.service	
          }	
          restart() {	
            sudo systemctl restart $1.service	
          }	
          stop() {	
            sudo systemctl stop $1.service	
          }	
          enable() {	
            sudo systemctl enable $1.service	
          }	
          status() {	
            sudo systemctl status $1.service	
          }	
          disable() {	
            sudo systemctl disable $1.service	
          }	
        fi
    # }}}
#}}}

bind -r '\C-s'
stty -ixon

source ~/.dotfiles/.bashrc-local
source ~/scripts/z.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# curl -s https://get.sdkman.io | bash
export SDKMAN_DIR="/home/skramer/.sdkman"
[[ -s "/home/skramer/.sdkman/bin/sdkman-init.sh" ]] && source "/home/skramer/.sdkman/bin/sdkman-init.sh"
