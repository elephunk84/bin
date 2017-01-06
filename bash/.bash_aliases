black='\e[0;30m'
blue='\e[0;34m'
green='\e[0;32m'
cyan='\e[0;36m'
red='\e[0;31m'
purple='\e[0;35m'
brown='\e[0;33m'
lightgray='\e[0;37m'
darkgray='\e[1;30m'
lightblue='\e[1;34m'
lightgreen='\e[1;32m'
lightcyan='\e[1;36m'
lightred='\e[1;31m'
lightpurple='\e[1;35m'
yellow='\e[1;33m'
white='\e[1;37m'
nc='\e[0m'

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/.bin:$HOME/.bin
export PATH

# Eternal History
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo `dt` `pwd` $$ $USER \
               "$(history 1)" >> ~/.bash_eternal_history'

# Bash Autocomplete
bind '"\e[A": history-search-backward' 
bind '"\e[B": history-search-forward'

# Remote Prompt
function __setprompt {

  local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
  local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
  if [ $SSH2_IP ] || [ $SSH_IP ] ; then
    local SSH_FLAG="@\h"
  fi
  PS1="$BLUE[\$(date +%H:%M)][\u$SSH_FLAG:\w]\\$ $NO_COLOUR"
  PS2="$BLUE>$NO_COLOUR "
  PS4='$BLUE+$NO_COLOUR '
}
__setprompt

# Extract Function
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }
 
alias dt='date "+%F %T"'
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la='ls -lah $LS_COLOR'
alias sl="ls"
alias l="ls"
alias s="ls"
alias ping="ping -c 1"
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'
alias raspi1="ssh -Y iainstott@192.168.0.4"
alias raspi2="ssh -Y osmc@192.168.1.2"
alias raspi3="ssh -Y pi@192.168.1.3"
alias raspi4="ssh -Y iainstott@192.168.1.4"
alias raspi5="ssh -Y iainstott@192.168.0.5"
alias raspi6="ssh -Y osmc@192.168.0.130"
alias raspi7="ssh -Y pi@192.168.0.131"
alias raspi8="ssh -Y pi@192.168.0.111"
alias server="ssh -Y iainstott@192.168.0.2"
alias bladeserver="ssh -Y iainstott@192.168.0.6"
alias sub="ssh -Y pi@192.168.0.128"
alias install="sudo apt-get update && sudo apt-get -y install"
alias install-suggests="sudo apt-get update && sudo apt-get -y install --install-suggests"
alias upgrade="sudo apt-get update && sudo apt-get -y upgrade"
alias cleanup="sudo apt-get autoclean && sudo apt-get autoremove && sudo apt-get clean && sudo apt-get remove && orphand"
alias wakebladeserver="ssh pi@192.168.0.5 'gpio write 1 0' && sleep 10 && wakeonlan 00:1a:64:23:e5:30"
alias sleepbladeserver="ssh iainstott@192.168.0.6 -t 'sudo poweroff -n'" 
alias reboot="sudo shutdown -r now"
alias manualiptv="ssh -Y iainstott@192.168.0.2 'source /home/iainstott/GitRepo/Scripts/lib/bash/kodiSORTIPTV; kodiSORTIPTV_GUI'"
alias burndvd="ssh -Y iainstott@192.168.0.2 'source /home/iainstott/GitRepo/Scripts/lib/bash/burnISO; burnISOGUI'"
alias wget="wget -c"
alias arduino="/opt/arduino-1.6.9/arduino"
alias arduino-dev="ssh -Y pi@192.168.0.130 arduino"
alias git-update='git add --all && git commit -m "update" && git push origin master' 
alias update-gitrepo='cd /home/iainstott/GitRepo/ && for i in $( ls ); do cd $i; echo "Repository = "$i; git-update; echo ""; cd /home/iainstott/GitRepo; done'
alias unigrep='grep -P "[^\x00-\x7F]"'
alias grep="grep --color=auto"
alias diskspace="du -S | sort -n -r |most"
alias f='more ~/.bash_eternal_history | grep '
alias sub-reboot="ssh pi@192.168.0.128 sudo shutdown -r now"
alias sub-update='cd ~/GitRepo/Submersible && git-update >> /dev/null && ssh pi@192.168.0.128 -t "cd Submersible;git pull"'

