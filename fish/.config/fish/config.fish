# basic setup
set -gx TERM xterm-256color
set -gx PATH /opt/homebrew/opt/postgresql@17/bin $HOME/.local/bin $HOME/.kiro $PATH

# load kiro mcp stuff if it exists
if not set -q KIRO_MCP_LOADED; and test -f ~/.kiro/.env.mcp
    for line in (cat ~/.kiro/.env.mcp | grep -v '^#' | grep -v '^[[:space:]]*$')
        set -l key_value (string split -m 1 '=' $line)
        if test (count $key_value) -eq 2
            set -gx $key_value[1] $key_value[2]
        end
    end
    set -g KIRO_MCP_LOADED 1
end

# interactive shell stuff
if status is-interactive
    starship init fish | source
    zoxide init fish | source
    mcfly init fish | source  # ctrl+r for history search
    
    # direnv loads on first prompt to speed up startup
    function __load_direnv --on-event fish_prompt
        direnv hook fish | source
        functions -e __load_direnv
    end
    
    set -g fish_vi_force_cursor 1
    set -g fish_ambiguous_width 1
    
    # fzf keybindings:
    # ctrl+alt+f - directories
    # ctrl+alt+l - git log
    # ctrl+alt+s - git status
    # ctrl+alt+p - processes
    # ctrl+v - variables
end

# ls replacements with eza
alias ls='eza --icons --group-directories-first'
alias ll='eza -l --icons --group-directories-first'
alias la='eza -la --icons --group-directories-first'
alias tree='eza --tree --icons'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias fm='yazi'

# modern cli tools
alias cat='bat --style=auto'
alias grep='rg'
alias find='fd'
alias top='btop'
alias ps='procs'
alias du='dust'
alias df='duf'
alias sed='sd'
alias help='tldr'

# editor
alias vim='nvim'
alias vi='nvim'
alias lg='lazygit'

# git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias glog='git log --oneline --graph --decorate'
