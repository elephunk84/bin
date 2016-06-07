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
alias ping="pinc -c 10"
alias mx='chmod a+x'
alias 000='chmod 000'
alias 644='chmod 644'
alias 755='chmod 755'
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
alias install-suggests="sudo apt-get update && sudo apt-get -y install --install-suggests"
alias upgrade="sudo apt-get update && sudo apt-get -y upgrade"
alias cleanup="sudo apt-get autoclean && sudo apt-get autoremove && sudo apt-get clean && sudo apt-get remove && orphand"
alias wakeserver="wakeonlan F0:4D:A2:DB:E0:D8"
alias sleepserver="ssh iainstott@192.168.0.110 sudo pm-hibernate" 
alias reboot="sudo shutdown -r now"
alias wget="wget -c"
alias arduino-dev="ssh -Y pi@192.168.0.130 arduino"
alias git-update='git add --all && git commit -m "update" && git push origin master' 
alias update-gitrepo='cd /home/iainstott/GitRepo/ && for i in $( ls ); do cd $i; echo "Repository = "$i; git-update; echo ""; cd /home/iainstott/GitRepo; done'
alias unigrep='grep -P "[^\x00-\x7F]"'
alias grep="grep --color=auto"
alias diskspace="du -S | sort -n -r |most"
alias f='more ~/.bash_eternal_history | grep '

function cdn(){ for i in `seq $1`; do cd ..; done;}
function cl(){ cd "$@" && la; }
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo `dt` `pwd` $$ $USER \ "$(history 1)" >> ~/.bash_eternal_history'
export GREP_OPTIONS='--color=auto'
export PAGER="/usr/bin/most -s"

if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
fi
if [ -f /etc/bash_completion.d/git-completion.bash ]; then
        . /etc/bash_completion.d/git-completion.bash;
fi
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]\$(__git_ps1 ' %s')\[\033[01;34m\] \$\[\033[00m\] "
export PS1="\[\033[G\]$PS1"

mountiso () {
  name=`basename "$1" .iso`
  mkdir "/tmp/$name" 2>/dev/null
  sudo mount -o loop "$1" "/tmp/$name"
  echo "mounted iso on /tmp/$name"
}

bind '"\e[A": history-search-backward' 
bind '"\e[B": history-search-forward'


# Easy extract
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
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
upinfo () {
echo -ne "${green}$HOSTNAME ${red}uptime is ${cyan} \t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}
mkcdr () {
    mkdir -p -v $1
    cd $1
}

translate ()
{
TRANSLATED=`lynx -dump "http://translate.reference.com/browse/${1}" | grep -i -m 1 -w "${2}:" | sed 's/^[ \t]*//;s/[ \t]*$//'`
if [[ ${#TRANSLATED} != 0 ]] ;then
   echo "\"${1}\" in ${TRANSLATED}"
   else
   echo "Sorry, I can not translate \"${1}\" to ${2}"
fi
}

function apt-history(){
      case "$1" in
        install)
              cat /var/log/dpkg.log | grep 'install '
              ;;
        upgrade|remove)
              cat /var/log/dpkg.log | grep $1
              ;;
        rollback)
              cat /var/log/dpkg.log | grep upgrade | \
                  grep "$2" -A10000000 | \
                  grep "$3" -B10000000 | \
                  awk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}

