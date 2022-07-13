

# config in ~/.config/fish/config.fish
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias g.='git add .'
alias ga='git commit -a'
alias gp='git push'
alias gl='git pull'
alias gs='git show'
alias gst='git status'
alias q='exit'
alias go_nano='cd ~/Desktop/nano'
alias go_vim='cd ~/Desktop/vim'
alias go_emacs='cd ~/Desktop/emacs'
alias go_lv='cd ~/Desktop/LvTextEditor'
alias Ag='sudo apt-get install'
alias Ar='sudo apt-get remove'
alias ..='cd ..'
alias ...='cd ../..'
alias vpn='bash ~/vpn.sh'
alias g.='git add .'
alias gc='git commit'
alias ga='git commit -a'
alias gp='git push'

# for rust
set -gx PATH "$HOME/.cargo/bin" $PATH;

# run tmux on start
if status is-interactive 
	and not set -q TMUX
exec tmux
end
clear
