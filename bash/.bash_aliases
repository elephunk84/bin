alias dt='date "+%F %T"'
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la='ls -lah $LS_COLOR'
alias sl="ls"
alias l="ls"
alias s="ls"
alias raspi1="ssh -Y root@192.168.0.200"
alias raspi2="ssh -Y osmc@192.168.1.2"
alias raspi3="ssh -Y pi@192.168.1.3"
alias raspi4="ssh -Y pi@192.168.1.4"
alias raspi5="ssh -Y pi@192.168.1.5"
alias raspi6="ssh -Y pi@192.168.0.130"
alias raspi7="ssh -Y pi@192.168.0.131"
alias raspi8="ssh -Y pi@192.168.0.111"
alias server="ssh -Y iainstott@192.168.0.110"
alias install="sudo apt-get update && sudo apt-get -y install"
alias upgrade="sudo apt-get update && sudo apt-get -y upgrade"
alias cleanup="sudo apt-get autoclean && sudo apt-get autoremove && sudo apt-get clean && sudo apt-get remove && orphand"
alias wakeserver="wakeonlan F0:4D:A2:DB:E0:D8"
alias sleepserver="ssh iainstott@192.168.0.110 sudo pm-hibernate" 
alias reboot="sudo reboot"
alias wget="wget -c"
alias arduino-dev="ssh -Y pi@192.168.0.130 arduino"
alias git-update='git add --all && git commit -m "update" && git push origin master' 
alias update-gitrepo='cd /home/iainstott/GitRepo/ && for i in $( ls ); do cd $i; echo "Repository = "$i; git-update; echo ""; cd /home/iainstott/GitRepo; done'
alias grep='grep --color=auto'
alias unigrep='grep -P "[^\x00-\x7F]"'

function cdn(){ for i in `seq $1`; do cd ..; done;}
function cl(){ cd "$@" && la; }
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo `dt` `pwd` $$ $USER \ "$(history 1)" >> ~/.bash_eternal_history'

if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
fi
if [ -f /etc/bash_completion.d/git-completion.bash ]; then
        . /etc/bash_completion.d/git-completion.bash;
fi
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]\$(__git_ps1 ' %s')\[\033[01;34m\] \$\[\033[00m\] "
export PS1="\[\033[G\]$PS1"
