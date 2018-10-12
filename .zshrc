export EDITOR=/usr/bin/vim
export HISTFILE=~/.zhsrc_history
export HISTSIZE=50000
export SAVEHIST=50000
export LC_MESSAGES=en_US.UTF-8

bindkey '\e[3~' delete-char
bindkey ';5D' backward-word
bindkey ';5C' forward-word

if [[ $EUID == 0 ]]
then
PROMPT=$'%{\e[1;31m%}%n %{\e[1;34m%}%~ #%{\e[0m%} '
else
PROMPT=$'%{\e[1;32m%}%n %{\e[1;34m%}%~ %#%{\e[0m%} '
fi
RPROMPT=$'%{\e[1;34m%}%T%{\e[0m%}'

autoload -U compinit promptinit
compinit
promptinit;

case "$TERM" in
  linux)  # Linux console
    bindkey '\e[1~'   beginning-of-line      # Home
    bindkey '\e[4~'   end-of-line            # End
    bindkey '\e[3~'   delete-char            # Del
    bindkey '\e[2~'   overwrite-mode         # Insert
  ;;
  screen)
    bindkey '\e[1~'   beginning-of-line      # Home
    bindkey '\e[4~'   end-of-line            # End
    bindkey '\e[3~'   delete-char            # Del
    bindkey '\e[2~'   overwrite-mode         # Insert
    bindkey '\e[7~'   beginning-of-line      # Home
    bindkey '\e[8~'   end-of-line            # End
    bindkey '\eOc'    forward-word           # ctrl cursor right
    bindkey '\eOd'    backward-word          # ctrl cursor left
    bindkey '\e[3~'   backward-delete-char   # This should not be necessary!
  ;;
  rxvt)
    bindkey '\e[7~'   beginning-of-line      # Home
    bindkey '\e[8~'   end-of-line            # End
    bindkey '\eOc'    forward-word           # ctrl cursor right
    bindkey '\eOd'    backward-word          # ctrl cursor left
    bindkey '\e[3~'   backward-delete-char   # This should not be necessary!
    bindkey '\e[2~'   overwrite-mode         # Insert
  ;;
  xterm*)
    bindkey '\e[H'    beginning-of-line      # Home
    bindkey '\e[F'    end-of-line            # End
    bindkey '\e[3~'   delete-char            # Del
    bindkey '\e[2~'   overwrite-mode         # Insert
    bindkey "^[[5C"   forward-word           # ctrl cursor right
    bindkey "^[[5D"   backward-word          # ctrl cursor left
    bindkey "^[[1;5C" forward-word           # ctrl cursor right
    bindkey "^[[1;5D" backward-word          # ctrl cursor left
  ;;
  sun)
    bindkey '\e[214z' beginning-of-line      # Home
    bindkey '\e[220z' end-of-line            # End
    bindkey '^J'      delete-char            # Del
    bindkey '^H'      backward-delete-char   # Backspace
    bindkey '\e[247z' overwrite-mode         # Insert
  ;;
esac

# bindkey -e; bindkey ' ' magic-space # do i want to use this, again?

bindkey '^R'    history-incremental-search-backward   # ctrl-r
bindkey '^t'    expand-or-complete-prefix
bindkey "^[[5~" history-beginning-search-backward     # PgUp for history search
bindkey '^[[6~' history-beginning-search-forward      # PgDown for history search
bindkey '^[[3~' delete-char                           # Backsapce
bindkey '^[[H'  beginning-of-line
bindkey '^[[F'  end-of-line
