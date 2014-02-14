############################
#open screen on every session
#if [ "$PS1" != "" -a "${STARTED_SCREEN:-x}" = x -a "${SSH_TTY:-x}" != x ]
#then
#STARTED_SCREEN=1 ; export STARTED_SCREEN
#[ -d $HOME/lib/screen-logs ] || mkdir -p $HOME/lib/screen-logs
#sleep 1
#screen -RR && exit 0
# normally, execution of this rc script ends here...
#echo "Screen failed! continuing with normal bash startup"
#fi
############################

#=== start of automatically maintained lines (do not delete)===
# .bashrc, sourced by interactive non-login shells (also called by .bash_profile)
export PATH=/sbin:/home/y/bin:/home/y/bin64:/usr/sbin:/bin:/usr/bin:/usr/local/bin:/usr/X11R6/bin:/homes/gporras/dev/yahoo/se/mps/env:/home/gporras/bin
umask 022
export CVSROOT=vault.yahoo.com:/CVSROOT
export CVS_RSH=/usr/bin/ssh

# svn
export SVN_SSH=/usr/bin/ssh
export SVNROOT=svn+ssh://svn.corp.yahoo.com
export SVN_EDITOR=/usr/bin/vim

#export SVNROOT=svn+ssh://svn-int.corp.yahoo.com
export SRCZIP="svn"

function parse_git_branch {

        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'

}

function proml {

  local        BLUE="\[\033[0;34m\]"

# OPTIONAL - if you want to use any of these other colors:

  local         RED="\[\033[0;31m\]"

  local   LIGHT_RED="\[\033[1;31m\]"

  local       GREEN="\[\033[0;32m\]"

  local LIGHT_GREEN="\[\033[1;32m\]"

  local       WHITE="\[\033[1;37m\]"

  local  LIGHT_GRAY="\[\033[0;37m\]"

# END OPTIONAL

  local     DEFAULT="\[\033[0m\]"
if [ "x$YROOT_NAME" != "x" ]; then
    PS1="\h : $YROOT_NAME \t \w \$ "
else
if [ "$PS1" != "" ]
then
    PS1="\h:\t \w$GREEN\$(parse_git_branch) $DEFAULT\$ "
      setenv ()  { export $1="$2"; }
    unsetenv ()  { unset $*; }
    if [ -f ~/.ssh-agent ]; then
        source ~/.ssh-agent
    fi
fi
fi

}

proml

if [ -f ~/.ssh/known_hosts ]; then
    complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | sed 's/.yahoo.com//g' | sort -u | grep -v "\["`;)" ssh
    complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | sed 's/.yahoo.com//g' | sort -u | grep -v "\["`;)" yvm
fi

if [ -f ~/.git-completion.bash ]; then
   source ~/.git-completion.bash
fi


#complete -W "$(yinst ls | sort)" yinst


#Media Databases Dbdist
alias nsql='mysql -A -h db3.news -u yahoo us'
alias nsql4='mysql -A -h db4.news -u yahoo us'
alias nsqlroot='mysql -N -A -h db3.news -u tonytam -pXXXX us'
alias rsqlp40dcx='mysql -A -h p40.news.dcx -u ynews -pXXXX us_news_premium'
alias nsqlprem='mysql -N -A -h db1-prem.news -u yahoo usp'
alias nsql2='mysql -A -h db2.news -u yahoo us'
alias nsqlroot2='/home/mysql/mysql/bin/mysql -N -u root -p'
#alias nsql='mysql -A -h feed5.news.yahoo.com -N -u yahoo us'

#List to databses http://twiki.corp.yahoo.com/view/MediaOps/MediaDBTroubleShooting

alias masterdb='mysql -u root -pXXXXXX -h masterdb.media.yahoo.com'
alias nsql_db1mediamud='mysql -u root -pXXXXXX -h db1.media.mud.yahoo.com'
alias nsql_db2mediamud='mysql -u root -pXXXXXX -h db2.media.mud.yahoo.com'
alias nsql_db1mediasp1='mysql -u root -pXXXXXX -h db1.media.sp1.yahoo.com'
alias nsql_db2mediasp1='mysql -u root -pXXXXXX -h db2.media.sp1.yahoo.com'
alias nsql_db1mediaac4='mysql -u root -pXXXXXX -h db1.media.ac4.yahoo.com'
alias nsql_db2mediaac4='mysql -u root -pXXXXXX -h db2.media.ac4.yahoo.com'

alias dbdist_db='mysql -u root -pXXXXXX -h dbmasterha.media.yahoo.com newsDBdist'
alias masterha='mysql -u root -pXXXXXX -h dbmasterha.media.yahoo.com newsDBdist'
alias masterha_top='mytop -u root -pXXXXXX -h dbmasterha.media.yahoo.com -d newsDBdist'
alias dbdist_bcp='ssh db1.qa.news.pool.ac4.yahoo.com'
alias dbdist_dev='ssh db1.qa.news.pool.ac4.yahoo.com'

alias dbdist1ac4_top='mytop -u newsdistreader -h db1.dbdist.news.ac4.yahoo.com -d newsDBdist_bcp -pXXXX'
alias dbdist1sp2_top='mytop -u newsdistreader -h db1.dbdist.news.sp2.yahoo.com -d newsDBdist_bcp -pXXXX'
alias dbdist2ac4_top='mytop -u newsdistreader -h db2.dbdist.news.ac4.yahoo.com -d newsDBdist_bcp -pXXXX'
alias dbdist2sp2_top='mytop -u newsdistreader -h db2.dbdist.news.sp2.yahoo.com -d newsDBdist_bcp -pXXXX'

alias mediadb7re2_top='mytop -u root -pXXXXXX -h db7.media.re2 -d newsDBdist'
alias mediadb7mud='mysql -u root -pXXXXXX -h db7.media.mud newsDBdist'
alias mediadb6mud='mysql -u root -pXXXXXX -h db6.media.mud newsDBdist'
alias db6mud_top='mytop -u root -pXXXXXX -h db6.media.mud -d newsDBdist'
alias db7mud_top='mytop -u root -pXXXXXX -h db7.media.mud -d newsDBdist'
alias mediadb6re2='mysql -u root -pXXXXXX -h db6.media.re2 newsDBdist'
alias mediadb7re2='mysql -u root -pXXXXXX -h db7.media.re2 newsDBdist'
alias mediadb8re2='mysql -u root -pXXXXXX -h db8.media.re2 newsDBdist'
alias mediadb8re2_top='mytop -u root -pXXXXXX -h db8.media.re2 -d newsDBdist'
alias nsql1sp1_top='mytop -A -h db1.jake.news.sp1 -u yahoo us'
alias nsql1sp1='mysql -A -h db1.jake.news.sp1 -u yahoo us'
alias nsql2sp1_top='mytop -A -h db2.jake.news.sp1 -u yahoo us'
alias nsql2sp1='mysql -A -h db2.jake.news.sp1 -u yahoo us'

# Apis News Photos machines
alias api1sp1='ssh api1.sub.news.sp1.yahoo.com'
alias api2sp1='ssh api2.sub.news.sp1.yahoo.com'
alias api3sp1='ssh api3.sub.news.sp1.yahoo.com'

alias api1mud='ssh api1.sub.news.mud.yahoo.com'
alias api2mud='ssh api2.sub.news.mud.yahoo.com'
alias api3mud='ssh api3.sub.news.mud.yahoo.com'

#FE php5 servers
#fe1.sub.news.vip.sp1
#fe1.sub.news.vip.mud
#fe1.sub.news.vip.ac4

#FE php4 servers
#fe1.news.vip.sp1
#fe1.news.vip.mud
#fe1.news.vip.ac4



alias mail_server='ssh web32308.mail.mud.yahoo.com'


#Jake AC4
alias db1ac4='ssh db1.jake.news.ac4.yahoo.com'
alias db2ac4='ssh db2.jake.news.ac4.yahoo.com'
alias nsql1ac4='mysql -u yahoo -h db1.jake.news.ac4.yahoo.com'
alias nsql1ac4_top='mytop -h db1.jake.news.ac4.yahoo.com -u yahoo'
alias nsql2ac4='mysql -u yahoo -h db2.jake.news.ac4.yahoo.com'
alias nsql2ac4_top='mytop -h db2.jake.news.ac4.yahoo.com -u yahoo'
alias nsql3ac4='mysql -u yahoo -h db3.jake.news.ac4.yahoo.com'
alias nsql3ac4_top='mytop -h db3.jake.news.ac4.yahoo.com -u yahoo'

alias db1sp2='ssh db1.jake.news.sp2.yahoo.com'
alias db2sp2='ssh db2.jake.news.sp2.yahoo.com'
alias db3sp2='ssh db3.jake.news.sp2.yahoo.com'
alias nsql1sp2='mysql -u yahoo -h db1.jake.news.sp2.yahoo.com'
alias nsql1sp2_top='mytop -h db1.jake.news.sp2.yahoo.com -u yahoo'
alias nsql2sp2='mysql -u yahoo -h db2.jake.news.sp2.yahoo.com'
alias nsql2sp2_top='mytop -h db2.jake.news.sp2.yahoo.com -u yahoo'
alias nsql3sp2='mysql -u yahoo -h db3.jake.news.sp2.yahoo.com'
alias nsql3sp2_top='mytop -h db3.jake.news.sp2.yahoo.com -u yahoo'

alias pc1ac4='ssh pc1.news.ac4.yahoo.com'
alias pc2ac4='ssh pc2.news.ac4.yahoo.com'
alias pub1ac4='ssh pub1.news.ac4.yahoo.com'
alias pub2ac4='ssh pub2.news.ac4.yahoo.com'
alias pub3ac4='ssh pub3.news.ac4.yahoo.com'

alias pc1sp2='ssh pc1.news.sp2.yahoo.com'
alias pc2sp2='ssh pc2.news.sp2.yahoo.com'
alias pub1sp2='ssh pub1.news.sp2.yahoo.com'
alias pub2sp2='ssh pub2.news.sp2.yahoo.com'
alias pub3sp2='ssh pub3.news.sp2.yahoo.com'


#Jake Poolboy Environment
alias jake_fe='ssh fe1.jakebcp.news.pool.ac4.yahoo.com'
alias jake_festory='ssh fe1.jakebcp.story.news.pool.ac4.yahoo.com'
alias jake_fesub='ssh fe1.jakebcp.sub.news.pool.ac4.yahoo.com'
alias jake_acache='ssh acache1.jakebcp.news.pool.ac4.yahoo.com'
alias jake_api='ssh api1.jakebcp.news.pool.ac4.yahoo.com'

#Jake Devel Poolboy
alias jake_apidev='ssh api1.jakedev.news.pool.ac4.yahoo.com'
alias jake_festorydev='ssh fe1.jakedev.story.news.pool.ac4.yahoo.com'
alias jake_acachedev='ssh acache1.jakedev.news.pool.ac4.yahoo.com'

# Jake Devel environment
alias db1dev='ssh db1.dev.jake.news.ac4.yahoo.com'
alias nsql1dev='mysql -u yahoo -h db1.dev.jake.news.ac4.yahoo.com'
alias nsql1dev_top='mytop -h db1.dev.jake.news.ac4.yahoo.com -u yahoo'
alias pc1dev='ssh pc1.dev.news.ac4.yahoo.com'
alias pub1dev='ssh pub1.dev.news.ac4.yahoo.com'
alias pub2dev='ssh pub2.dev.news.ac4.yahoo.com'
alias pub2dev='ssh pub3.dev.news.ac4.yahoo.com'

alias yts2qa='ssh yts2.qa.news.pool.ac4.yahoo.com'

alias lsjakedev='
echo "db1.dev.jake.news.ac4.yahoo.com"
echo "pc1.dev.news.ac4.yahoo.com"
echo "pub1.dev.news.ac4.yahoo.com"
echo "pub2.dev.news.ac4.yahoo.com"
echo "pub3.dev.news.ac4.yahoo.com"

#Canada Jake
alias nsqlca='mytop -A -h db100.jake.ca.re4.yahoo.com -u yahoo americas-live-ca'
alias pg1ca='ssh pg1.jake.ca.re4.yahoo.com'

#Photo ratings
alias f1ratings='ssh feed1.ratings.news.sp1.yahoo.com'

# Mail feed machines
alias feed1sp1='ssh feed1.mie.corp.sp1.yahoo.com'  #Live
alias feed1ac4='ssh feed1.mie.corp.ac4.yahoo.com'  #Backup

#Console machines
alias toolsp1='ssh tool1.sp1.yahoo.com'
alias toolmud='ssh tool1.mud.yahoo.com'
alias toolac4='ssh tool1.ac4.yahoo.com'

#Search Envoronment Commands
alias build-search="${HOME}/cvs/yahoo/properties/news/components/search/destinations/packages/build.pl -i us,uk -b"
alias build-search-all="${HOME}/cvs/yahoo/properties/news/components/search/destinations/packages/build.pl -i all -b"
alias deploy-search='deploy_search'

alias coke='~/cvs/yahoo/properties/media/ops/mon/mnode/properties/media_mnode_news/ynews_coke_api_check/ynews_coke_api_check.pl --hostname api1.news.vip.sp1.yahoo.com'
alias mnodeg='ssh mnodeg-hot.media.corp.yahoo.com'

#Julian devel redhat
alias julian='ssh broughtclear.corp.yahoo.com'

# dropbox , just works in pc1.news.[ac4-sp2] machines
alias tailfeeds='tail -f /home/y/logs/ynews_process_feeds_dir/run.log'
alias dropbox='sudo -u yahoo ssh -p 2222 -i /etc/ssh/yahoo/identity ynews@dropbox.yahoo.com'
alias dropbox1='sudo -u yahoo ssh -p 2222 -i /etc/ssh/yahoo/identity ynews@dropbox1.ops.sp2.yahoo.com'

#eunews dropbox
alias eudropbox='ssh dropbox5.ukl.yahoo.com'

#Brooklyn jake cgi rotation
alias jake_gui='rotation editjake.news.a1.b.yahoo.com'

#steve kupper dev box
alias ride='ssh ridecarehat.corp.yahoo.com'

#nagios notifications turn on/off
alias oor_stop='echo "DISABLE_SERVICEGROUP_SVC_NOTIFICATIONS;http-homepage-articles-comments" | ymon -e http://mnodeg-hot.media.corp.yahoo.com:9481/ nagios'

function deploy_search() {
   if [ "$YROOT_NAME" == "news-search" ]
   then
     cd $HOME/cvs/yahoo/properties/news/components/search/destinations/packages/
     yinst i search_yahoo_*_news*.tgz
   else
     echo "Not in news-search yroot: YROOT_NAME=$YROOT_NAME"
   fi
}

alias myq_ops="cd /homes/bsandvik/ops/env"

alias 'c_db1.dbdist.news.ac4'='ssh -L 3307:localhost:3306 db1.dbdist.news.ac4.yahoo.com'

alias 'db1.dbdist.news.ac4'='echo "using port 3307";ssh -L 3307:localhost:3306 db1.dbdist.news.ac4.yahoo.com'
alias 'db2.dbdist.news.ac4'='echo "using port 3307";ssh -L 3307:localhost:3306 db2.dbdist.news.ac4.yahoo.com'
alias 'db1.dbdist.news.mud'='echo "using port 3307";ssh -L 3307:localhost:3306 db1.dbdist.news.mud.yahoo.com'
alias 'db2.dbdist.news.mud'='echo "using port 3307";ssh -L 3307:localhost:3306 db2.dbdist.news.mud.yahoo.com'
alias 'db1.dbdist.news.sp2'='echo "using port 3307";ssh -L 3307:localhost:3306 db1.dbdist.news.sp2.yahoo.com'
alias 'db2.dbdist.news.sp2'='echo "using port 3307";ssh -L 3307:localhost:3306 db2.dbdist.news.sp2.yahoo.com'

alias 'db1.jake.news.ac4'='echo "using port 3307";ssh -L 3307:localhost:3306 db1.jake.news.ac4.yahoo.com'
alias 'db2.jake.news.ac4'='echo "using port 3307";ssh -L 3307:localhost:3306 db2.jake.news.ac4.yahoo.com'
alias 'db3.jake.news.ac4'='echo "using port 3307";ssh -L 3307:localhost:3306 db3.jake.news.ac4.yahoo.com'
alias 'db1.jake.news.sp2'='echo "using port 3307";ssh -L 3307:localhost:3306 db1.jake.news.sp2.yahoo.com'
alias 'db2.jake.news.sp2'='echo "using port 3307";ssh -L 3307:localhost:3306 db2.jake.news.sp2.yahoo.com'
alias 'db3.jake.news.sp2'='echo "using port 3307";ssh -L 3307:localhost:3306 db3.jake.news.sp2.yahoo.com'

alias mc='mysql -u m3d1A0ps -pXXXX'

alias mysqlc='mysql -u m3d1A0ps -pXXXX'

alias cm3stat='sudo /var/cm3/bin/svstat /var/cm3/service/*'
alias cm3pause='sudo /var/cm3/bin/cm3_pause -p'
alias cm3stop='sudo /var/cm3/bin/svc -d /var/cm3/service/cm3_client'
alias cm3logs='cd /var/cm3/logs/'

alias hudson_mnode='ssh mnodeh-stage.media.corp.yahoo.com'

#test jail from 1-20
alias testjail1='ssh testjail1.media.sp1'
#test jail from 21-40
alias testjail2='ssh testjail2.media.sp1'

alias hudson_master='ssh master5.ci.media.pool.corp.sp2.yahoo.com'
alias hudson_master_bcp='ssh master4.ci.media.pool.corp.sp2.yahoo.com'
alias hudson_master_test='ssh master3.ci.media.pool.corp.sp2.yahoo.com'
alias hudson_master_test_bcp='ssh master1.ci.global.media.pool.corp.sp2.yahoo.com'

alias ls_hudson_masters='igor fetch -members globalmedia.hgp-hudson_master'
alias ls_hudson_masters_prod='igor fetch -members globalmedia.hgp-hudson_master.env-prod.loc-sp2'
alias ls_hudson_masters_test='igor fetch -members globalmedia.hgp-hudson_master.env-test.loc-sp2'
alias ls_hudson_slaves='igor fetch -members globalmedia.hgp-hudson_slave'
alias ls_hudson_slaves_prod='igor fetch -members globalmedia.hgp-hudson_slave.env-prod.loc-sp2'
alias ls_hudson_slaves_test='igor fetch -members globalmedia.hgp-hudson_slave.env-test.loc-sp2'

alias fbash='cat ~/.bash_profile|grep '
alias gpgcrypt='gpg -a -r media_ci --encrypt '

# YTS debug mode
alias yts_debug='sudo /home/y/bin/traffic_server  -T "http_hdrs.*"'

# dist mirror servers sudo to op_stack on
alias distgq1='ssh yum-01.dist.gq1.yahoo.com'
alias distbf1='ssh yum-01.dist.bf1.yahoo.com'
alias dist='ssh yum-01.dist.gq1.yahoo.com'

#DBDIST configuration
#Master db6.media.mud.yahoo.com
#   db1.dbdist.news.ac4.yahoo.com slave of db6.media.mud
#     db1.dbdist.news.ac4.yahoo.com salve of db1.dbdist.news.ac4
#   db1.dbdist.news.vip.sp2 slave of db1.dbdist.news.ac4
#

#VirtualBox
alias ustart='/usr/bin/VBoxManage startvm efda7186-f6a9-4221-a557-72fa347d7182 --type headless'
alias ustop='/usr/bin/VBoxManage controlvm efda7186-f6a9-4221-a557-72fa347d7182 poweroff'
alias ubuntu='/usr/bin/ssh 192.168.56.101'


#SHH Agent env variables
alias agent='ssh-agent | head -2 > ~/.ssh-agent'

#. ~/.profile

#echo "show processlist" | mysql  -u root  -h db6.media.scd  -pXXXXXX | grep -v Sleep

#sudo ln -sf /usr/share/zoneinfo/US/Pacific localtime   SET PST TIME
#bash history removal everytime
# add this .bash_history -> /dev/null
#
