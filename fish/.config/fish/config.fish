if status is-interactive
    fastfetch
end

# export 
set fish_greeting

# Set the cursor shapes for the different vi modes.
# set fish_cursor_default     block      blink
# set fish_cursor_insert      line       blink
# set fish_cursor_replace_one underscore blink
# set fish_cursor_visual      block

export EDITOR='lvim'
export VISUAL='lvim'
export PAGER='less'
export MANPAGER='less'

alias v="lvim"

alias ls='exa --git --icons'
alias la='ls -a'
alias ll='ls -al'
alias l='ls'

alias clean-packages="pacman -Scc && yay -Scc"
alias start-kvm="virsh net-start default"
alias get-drives="sudo parted -l"
alias mic-listen="pacmd load-module module-loopback"
alias mic-unlisten="pacmd unload-module module-loopback"
alias pc="unset HISTFILE && sudo protonvpn c"
alias pd="unset HISTFILE && sudo protonvpn d"
alias uh="unset HISTFILE"
alias dust="dust -X hdd"

function cr
  g++ $argv[1] -o builtFile && ./builtFile
end

function gra
  git remote add origin git@github.com:ranamashood/$argv[1].git
end

function list-packages-size
  expac "%n %m" | sort -gk2 | awk '{sum+=$2; printf "%-30s%20.2f MiB\n", $1, $2/2^20} END {printf "----------\n%-30s%20.2f GiB\n", "Total:", sum/2^30}'
end

function list-packages-date
  expac --timefmt='%F %T' '%l %n' | sort -n
end

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish
starship init fish | source
