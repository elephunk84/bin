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
alias raspi1="ssh -Y root@192.168.0.200"
alias raspi2="ssh -Y osmc@192.168.1.2"
alias raspi3="ssh -Y pi@192.168.1.3"
alias raspi4="ssh -Y pi@192.168.1.4"
alias raspi5="ssh -Y pi@192.168.1.5"
alias raspi6="ssh -Y osmc@192.168.0.130"
alias raspi7="ssh -Y pi@192.168.0.131"
alias raspi8="ssh -Y pi@192.168.0.111"
alias server="ssh -Y iainstott@192.168.0.110"
alias install="sudo apt-get update && sudo apt-get -y install"
alias install-suggests="sudo apt-get update && sudo apt-get -y install --install-suggests"
alias upgrade="sudo apt-get update && sudo apt-get -y upgrade"
alias cleanup="sudo apt-get autoclean && sudo apt-get autoremove && sudo apt-get clean && sudo apt-get remove && orphand"
alias wakeserver="wakeonlan F0:4D:A2:DB:E0:D8"
alias sleepserver="ssh iainstott@192.168.0.110 sudo pm-hibernate" 
alias reboot="sudo shutdown -r now"
alias wget="wget -c"
alias arduino="/opt/arduino-1.6.9/arduino"
alias arduino-dev="ssh -Y pi@192.168.0.130 arduino"
alias git-update='git add --all && git commit -m "update" && git push origin master' 
alias update-gitrepo='cd /home/iainstott/GitRepo/ && for i in $( ls ); do cd $i; echo "Repository = "$i; git-update; echo ""; cd /home/iainstott/GitRepo; done'
alias unigrep='grep -P "[^\x00-\x7F]"'
alias grep="grep --color=auto"
alias diskspace="du -S | sort -n -r |most"
alias f='more ~/.bash_eternal_history | grep '


