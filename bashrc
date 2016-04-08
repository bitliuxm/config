export PATH="~/bin:$PATH"
#export PS1="\n\u@\h:\w \$(vcprompt -f '%b%m%u')\n>"

alias gs="git status"
alias gp="git-push"
alias gcl="git-clone"
alias ga="git add"
alias gd="git diff"
alias gb="git branch"
alias gbl="git blame"
alias gc="git commit"
alias gco="git checkout"
alias gl="git log --oneline --graph --decorate"
alias glo="git log --oneline --graph"
#alias ls="ls -al"
alias glu="git log -u"
alias hpush="history | grep push"
alias change='change_wcn_product `gettop`'
#alias change=' _(){ which gettop; if [ "$?" -eq 0 ] ; then change_wcn_product `gettop` ; else change_wcn_product ; fi };_'

alias touchall='find . -name "*" -type f -print0 | xargs -n 1 --null touch'
alias mmj='mm -j23'

#alias mm='noglob mm'
alias repoi='repo init -u gitadmin@gitsrv01.spreadtrum.com:android/platform/manifest -b'
alias vi='vimfunc(){ echo $1 ; if [[ "$1" =~ ^.*:([[:digit:]]).* ]]; then var=`echo "$1" | sed "s/:\([[:digit:]]\)/ +\1/g" `; vim ${var} ; else vim $* ;  fi } ; vimfunc'
alias gclc='var=`pwd` ; git-clone `basename ${var}`'
