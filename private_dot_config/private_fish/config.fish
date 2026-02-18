if status is-interactive
    source (starship init fish --print-full-init | psub)
    # Commands to run in interactive sessions can go here
    source (zoxide init fish | psub)
    source (direnv hook fish | psub)
    source (atuin init fish --disable-up-arrow | psub)
end

alias ssh-pw='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'
alias scp-pw='scp -o PreferredAuthentications=password -o PubkeyAuthentication=no'
alias tmpdir='cd $(mktemp -d)'
alias vim="nvim"
alias vimdiff="nvim -d"
alias k="kubectl"

set -x EDITOR nvim

set fish_greeting

# add stuff to path
fish_add_path $HOME/.local/bin
fish_add_path -a /usr/local/go/bin
fish_add_path -a $HOME/.cargo/bin
fish_add_path -a $HOME/.nargo/bin
fish_add_path -a $HOME/.bb
fish_add_path -a "$HOME/.foundry/bin"

fish_add_path -a /opt/nvim-linux-arm64/bin

starship init fish | source

alias ehere="explorer.exe ."

set -x NARGO_HOME "$HOME/.nargo"

if status is-login and status is-interactive
    keychain --eval $HOME/.ssh/id_ed25519 --quiet | source
end



