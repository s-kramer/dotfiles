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

bind -r '\C-s'
stty -ixon

source ~/.dotfiles/.sh-commonrc
source ~/.dotfiles/.bashrc-local
source ~/scripts/z.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# curl -s https://get.sdkman.io | bash
export SDKMAN_DIR="/home/skramer/.sdkman"
[[ -s "/home/skramer/.sdkman/bin/sdkman-init.sh" ]] && source "/home/skramer/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
