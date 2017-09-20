export PATH="$HOME/bin:$PATH"
export EDITOR="/usr/bin/vim"
export CRON_LOG="/home/bit/cron.log"
#export PATH="$HOME/bash2bin:$PATH"
#export PS1="\n\u@\h:\w \$(vcprompt -f '%b%m%u')\n>"

alias gs="git status"
#alias gp="git-push"
#alias gcl="git-clone"
alias ga="git add"
#alias gd="git diff"
alias gd="git --no-pager diff"
alias gdp="git diff"
alias gb="git branch"
alias gbr="gb -r | head -3"
alias gpwd="git rev-parse --git-dir"
alias gwd="git rev-parse --git-dir"
alias gbl="git blame"
alias gc="git commit"
alias gco="git checkout"
alias gl="git log --oneline --graph --decorate"
alias glo="git log --oneline --graph"
#alias ls="ls -al"
alias glu="git log -u"
alias gluf='git log --pretty="%H,%ci,%Cred%ae,%Cgreen%s"'
alias gluid='_(){ glu $1 | grep "Change-Id" | head -1 }; _'

#alias hpush="history | grep push"
alias change='change_wcn_product `gettop`'
#alias change=' _(){ which gettop; if [ "$?" -eq 0 ] ; then change_wcn_product `gettop` ; else change_wcn_product ; fi };_'

alias touchall='find . -name "*" -type f -print0 | xargs -n 1 --null touch'
alias mmj='mm -j23'

#alias mm='noglob mm'
#alias repoi='repo init -u gitadmin@gitsrv01.spreadtrum.com:android/platform/manifest -b'

alias vii='vim_grep_index'
#alias gclc='var=`pwd` ; git-clone `basename ${var}`'
#alias vilog='vi `ls | grep "log.*txt" | sort -r | head -1`'

## under debugging

#alias makej='makefun(){ set -x ; LOG=$PWD/log.$(date +%m%d%H%M%S).txt ; if [ -z "$*" ] ; then echo "target:null" ;  make -j 8  2>&1 | tee "$LOG" ; else echo "target:" "$*" ; bash -c "make -j 8 $*" 2>&1 | tee "$LOG" ; fi ; set +x } ; makefun'
#alias log='logfun(){ set -x ; LOG=$PWD/log.$(date +%m%d%H%M%S).txt ; if [ -z "$*" ] ; then echo "target:null" ; else echo "target:" "$*" ; bash -c "$*" 2>&1 | tee "$LOG" ; fi ; set +x } ; logfun'
alias vi='vimfunc(){set -x ;  echo $1 ; if [[ "$1" =~ ^.*:([[:digit:]]).* ]]; then var=`echo "$1" | sed "s/:\([[:digit:]]\)/ +\1/g" `; echo "${var}" ; vim ${var} ; else echo "$*" ; vim "$*" ;  fi ; set +x } ; vimfunc'
alias slashsed='slash_fun(){ set -x ; echo -E "$*" | sed -e '"'"'s/\\/\//g'"'"' ; set +x } ;  slash_fun  '

#alias tmux='alwaysd(){ set -x ; if [ "attach" = "$1" ]; then options = "$*" ; options2 = cat ${options} | sed "s/tmux attach/tmux attach -d/g" ; echo "$opetions2" ; fi ; set +x } ; alwaysd'
#alias tmux='alwaysd(){ set -x ; if [ "attach" = "$1" ]; then para="$*" ; echo "$para" ; para2=`echo $para | sed "s/attach/attach -d/g"` ; tmux $para2 ; fi ; set +x } ; alwaysd'

source /home/bit/.bashrc_local

