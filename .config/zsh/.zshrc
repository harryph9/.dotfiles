#################################################
#               SET PATH                        #
#################################################
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
. "$HOME/.asdf/asdf.sh"

export EDITOR=nvim


#################################################
#               SET THEME                       #
#################################################
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ' S'
zstyle ':vcs_info:*' unstagedstr ' !S'
zstyle ':vcs_info:git:*' formats '──[%b%u%c]'
zstyle ':vcs_info:git:*' actionformats '──[%b%a%u%c]'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
    hook_com[staged]+=' !T'
  fi
}

precmd() {
  vcs_info
}

PROMPT='┌──(%n@%m)──[%~]${vcs_info_msg_0_}
└─$ '

#################################################
#               PLUGINS                         #
#################################################
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

#################################################
#               SET ALIAS                       #
#################################################
alias gl="git clone"
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias vim="nvim"
alias v="nvim"

#################################################
#               ASDF                            #
#################################################
. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit
