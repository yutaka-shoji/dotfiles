# .zshrc

# call fish shell
if type fish >/dev/null 2>&1; then
  # interactive shell only
  case $- in
    *i*)
      exec fish;;
    *)
      return;;
  esac
else
  echo "fish is NOT installed (.zshrc)"
fi

# zplug
# git clone if not zplug
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

# init zplug
source ~/.zplug/init.zsh

# list plugin
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# manage zplug itself
zplug "zplug/zplug", hook-build:'zplug --self-manage'

# install plugins
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# load plugins
zplug load

zmodload zsh/zpty
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

#emacs like keybind
bindkey -e

# source .zshrc.local
if [ -f ~/.zshrc.local ]; then
  . ~/.zshrc.local
fi

# aliases
alias history='history -i'
alias vi='vim'
alias la='ls -al'
alias ll='ls -l'

# for GNU ls colors
eval $(dircolors -b ~/.dircolors)

#autoload -Uz compinit && compinit
autoload -Uz colors && colors
setopt auto_param_keys
setopt auto_list
setopt auto_menu
setopt correct
setopt no_beep
setopt nolistbeep
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${LS_COLORS}"

#history file
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history

#Prompt customize
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
if [ -n "$SSH_CONNECTION" ]; then
  PROMPT='
%F{blue}%n@%m[%~]%f ${vcs_info_msg_0_}
$ '
else
  PROMPT='
%F{blue}%n[%~]%f ${vcs_info_msg_0_}
$ '
fi

#if (which zprof > /dev/null 2>&1) ;then
#  zprof
#fi
