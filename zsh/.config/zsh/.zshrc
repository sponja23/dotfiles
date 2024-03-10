# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# .profile
source "$HOME/.profile"

# Path of oh-my-zsh installation
export ZSH="/home/sponja/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    autojump
    colored-man-pages
    command-not-found
    copypath
    emoji
    git
    git-flow-avh
    gitignore
    screen
    sudo
    themes
    web-search
    zsh-syntax-highlighting
    dirhistory
    copyfile
    copypath
    pip
    npm
    stack
    tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases
alias python=python3
alias pip=pip3
alias pn=pnpm

# zoxide setup
eval "$(zoxide init --cmd cd zsh)"

# Functions
function open() {
    xdg-open $@ > /dev/null 2>&1 & disown
}

function zshconfig() {
    if [[ -f "$HOME/.zshrc" ]]; then
        $EDITOR "$HOME/.zshrc" 
    elif [[ -f "$HOME/.config/zsh/.zshrc" ]]; then
        $EDITOR "$HOME/.config/zsh/.zshrc" 
    else
        echo "zsh config not found"
    fi
}

# Completions
autoload compinit && compinit
autoload bashcompinit && bashcompinit

zstyle ':completion:*' verbose yes

# [ "$(command -v pipenv)" ] && eval "$(_PIPENV_COMPLETE=zsh_source pipenv)" # Pipenv completions
# [ -x "$(command -v rclone)" ] && rclone completion zsh > "${fpath[1]}/_rclone"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Syntax Highlighter changes
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=white'

# fzf setup
[[ ! -f /usr/share/fzf/key-bindings.zsh ]] || source /usr/share/fzf/key-bindings.zsh
[[ ! -f /usr/share/fzf/completion.zsh ]] || source /usr/share/fzf/completion.zsh

# The Fuck setup
[ -x "$(command -v thefuck)" ] && eval $(thefuck --alias)

# git functions
_ZSHRC_FILE="$(readlink -f $ZDOTDIR/.zshrc)"
for file in "$(dirname $_ZSHRC_FILE)"/functions/*; do
    source $file
done

# VSCode shell integration
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
