# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH:$HOME/go/bin:$HOME/.local/bin:$HOME/.cargo/bin:$HOME/flutter/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-autosuggestions
    fast-syntax-highlighting

    golang
    rust

    git 
    sudo
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Created by fodev.org
function fod(){
    case $1 in
        "--enable" | "-e")
            export http_proxy=http://fodev.org:8118/
            export https_proxy=https://fodev.org:8118/
            export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
            export HTTP_PROXY=http://fodev.org:8118/
            export HTTPS_PROXY=https://fodev.org:8118/
            export NO_PROXY="localhost,127.0.0.1,localaddress,.localdomain.com"
            echo "enable fod proxy !"
        ;;
        "--disable" | "-d")
            unset http_proxy
            unset https_proxy
            unset no_proxy
            unset HTTP_PROXY
            unset HTTPS_PROXY
            unset NO_PROXY
            echo "disable fod proxy !"
        ;;
        *)
            echo "Usage : fod [-e | --enable] [-d | --disable]"
            echo "Example : "
            echo "  fod --enable for enable fod proxy "
            echo "  fod --disable for disable fod proxy "
        ;;
    esac
}

# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias zshconfig="nvim ~/.zshrc"
alias pa='php artisan'
alias drun='docker compose exec -it app'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform

# opam configuration
[[ ! -r /home/mohammad/.opam/opam-init/init.zsh ]] || source /home/mohammad/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

# load nvm
source /usr/share/nvm/init-nvm.sh

eval "$(fzf --zsh)"

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ---- Eza (better ls) -----
alias ls="eza --color=always --long --git --icons=always --no-time"

# thefuck alias
eval $(thefuck --alias)

aws_tasks () {
    local cluster=${1}
    local service=${2}

    aws ecs list-tasks --cluster ${cluster} --service ${service}
}

aws_shell () {
    local cluster=${1}
    local task=${2}
    local container=${3}

    aws ecs execute-command --cluster ${cluster} --task ${task} --container ${container} --command /bin/sh --interactive
}

export GIT_PAGER=bat
