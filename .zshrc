# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# General Config
ZSH_TMUX_AUTOSTART=true

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# 
HIST_STAMPS="dd/mm/yyyy"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Plugins
source /home/aravindbk-gatik/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle tmux
antigen bundle common-aliases
antigen bundle fasd
antigen bundle MichaelAquilina/zsh-you-should-use

antigen theme romkatv/powerlevel10k

antigen apply

# Custom sources
tmux source ~/.tmux.conf
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases and functions
tmux rename-window "$(hostname -s)"
ssh() {
    tmux rename-window "$*"
    command ssh "$@"
    tmux rename-window "$(hostname -s)"
}

# Work aliases
alias devstart="cd ~/work/adehome/navigator && ade start"
alias devinto="cd ~/work/adehome/navigator && ade enter"
alias devstop="cd ~/work/adehome/navigator && ade stop"
alias apstart="cd ~/work/adehome/repos/apollo/docker/scripts && bash dev_start.sh"
alias apinto="cd ~/work/adehome/repos/apollo/docker/scripts && bash dev_into.sh"

source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aravindbk-gatik/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aravindbk-gatik/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/aravindbk-gatik/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aravindbk-gatik/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

