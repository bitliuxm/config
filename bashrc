export PATH="/home/bit/workspace/bg5:$HOME/bin:$PATH"
export EDITOR="/usr/bin/vim"
export CRON_LOG="/home/bit/cron.log"
ulimit -c unlimited
#export PATH="$HOME/bash2bin:$PATH"
#export PS1="\n\u@\h:\w \$(vcprompt -f '%b%m%u')\n>"

alias gs="git status"
# ignore untracked file
alias gsn="git status -uno"
#alias gp="git-push"
#alias gcl="git-clone"
alias ga="git add"
# ignore untracked file
alias gau="git add -u"
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
alias glo="git --no-pager log --oneline --graph"
#alias ls="ls -al"
alias glu="git log -u"
alias gluf='git --no-pager log --pretty="%H,%ci,%Cred%ae,%Cgreen%s"'
alias gluid='_(){ glu $1 | grep "Change-Id" | head -1 }; _'
# commit without change the commit message
alias gam='git commit --amend --no-edit'
# use gco instead of reset, cause we need to keep the cached modify
#alias grst='cd `git rev-parse --git-dir` ; cd .. ; git reset HEAD --hard ; git clean -df'
# can not use -f for git checkout, cause it will reset the index
alias grst='curdir=`pwd` ; cd `git rev-parse --git-dir` ; cd .. ; git checkout . ; git clean -df ; cd $curdir'

alias gfp='git format-patch -1'

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

# for googlesource repo mirror
# usage: qinghua git clone ... | qinghua repo init ...
qinghua(){ set -x ; if [[ "$*" =~ ^git.*  ]] ; then qinghua_cmd=`echo "$*" | sed 's/android.googlesource.com/aosp.tuna.tsinghua.edu.cn/'` ; elif [[ "$*" =~ ^repo.*  ]] ; then qinghua_cmd=`echo "$*" "--repo-url=https://gerrit-google.tuna.tsinghua.edu.cn/git-repo"` ; fi; $qinghua_cmd ; set +x }
#alias makej='makefun(){ set -x ; LOG=$PWD/log.$(date +%m%d%H%M%S).txt ; if [ -z "$*" ] ; then echo "target:null" ;  make -j 8  2>&1 | tee "$LOG" ; else echo "target:" "$*" ; bash -c "make -j 8 $*" 2>&1 | tee "$LOG" ; fi ; set +x } ; makefun'
#alias log='logfun(){ set -x ; LOG=$PWD/log.$(date +%m%d%H%M%S).txt ; if [ -z "$*" ] ; then echo "target:null" ; else echo "target:" "$*" ; bash -c "$*" 2>&1 | tee "$LOG" ; fi ; set +x } ; logfun'
#alias vi='vimfunc(){set -x ;  echo $1 ; if [[ "$1" =~ ^.*:([[:digit:]]).* ]]; then var=`echo "$1" | sed "s/:\([[:digit:]]\)/ +\1/g" `; echo "${var}" ; vim ${var} ; else echo "$*" ; vim "$*" ;  fi ; set +x } ; vimfunc'
alias vi_debug='vimfunc(){ set -x ;  echo 1:$1 2:$2 ; if [ -z "$2" ]; then  if [[ "$1" =~ ^.*:([[:digit:]]).* ]]; then var=`echo "$1" | sed "s/:\([[:digit:]]\)/ +\1/g" `; echo "${var}" ; vim ${var} ; else echo "$*" ; vim $* ;  fi ;  else vim $* ; fi;  set +x } ; vimfunc'
alias vi='vimfunc(){ if [ -z "$2" ]; then  if [[ "$1" =~ ^.*:([[:digit:]]).* ]]; then var=`echo "$1" | sed "s/:\([[:digit:]]\)/ +\1/g" `; vim ${var} ; else vim $* ;  fi ;  else vim $* ; fi; } ; vimfunc'
alias slashsed='slash_fun(){ set -x ; echo -E "$*" | sed -e '"'"'s/\\/\//g'"'"' ; set +x } ;  slash_fun  '

#alias tmux='alwaysd(){ set -x ; if [ "attach" = "$1" ]; then options = "$*" ; options2 = cat ${options} | sed "s/tmux attach/tmux attach -d/g" ; echo "$opetions2" ; fi ; set +x } ; alwaysd'
#alias tmux='alwaysd(){ set -x ; if [ "attach" = "$1" ]; then para="$*" ; echo "$para" ; para2=`echo $para | sed "s/attach/attach -d/g"` ; tmux $para2 ; fi ; set +x } ; alwaysd'

# for local configure load
if [ -e /home/bit/.bashrc_local ]
then
	source /home/bit/.bashrc_local
fi

