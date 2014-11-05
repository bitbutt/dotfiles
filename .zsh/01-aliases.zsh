alias battp="cat /sys/class/power_supply/BAT0/capacity" # battery percent
alias batts="cat /sys/class/power_supply/BAT0/status" # battery status
alias cp="cp -rv"
alias fixvpn="sudo systemctl restart openvpn@pia.service"
alias htop="htop -s PERCENT_MEM"
alias la="ls -A"
alias lal="ls -Al"
alias ll="ls -l"
alias ls="ls --tabsize=0 --color=auto --human-readable --group-directories-first"
alias mount="sudo mount"
alias pinga="ping -c 3 archlinux.org"
alias pingg="ping -c 3 google.com"
alias reboot="sudo reboot"
alias rm="rm -vir"
alias screenshot="scrot -cd 5"
alias shutdown="sudo shutdown -h +0"
alias sizes="du -a -BM --max-depth=1"
alias squish="tar -cvzf"
alias svim="sudo vim"
alias umount="sudo umount"
alias upgrade="sudo pacman -Syu"
alias wifi="sudo wifi-menu wlp0s29u1u2"
#alias wifi="wicd-curses"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias :wq="exit"
alias :q="exit"

# Suffix Aliases
alias -s pdf='zathura'
alias -s {gif,jpg,png}='sxiv'
alias -s {c,conf,css,h,hs,htm,html,java,txt,vim}='vim'
