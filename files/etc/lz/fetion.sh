#!/bin/sh

nowtime=`date  "+%Y-%m-%d %T %A"`
#Subject="Openwrt_Subject $nowtime"
Subject="Openwrt Subject"
msg=$1

  if [ $# -ge 2 ]; then
      {
       Subject=$1
       msg=$2 
      }   
   else
     {
     if [ $# -eq 1 ]; then
       {
      
      #Subject="openwrt_sub $nowtime"
       Subject="Openwrt Subject"

      msg=$1
       
       }    
    else
       {
      read  -p "please enter :" msg
       }


    fi;
    }
  fi
 
echo sendmail $msg 



#. $IPKG_INSTROOT/etc/functions.sh

# We need this to actually send the mail, so make sure it's installed msmtp
sendmail=/usr/sbin/sendmail


filepath=/tmp/.trextraf
mkdir -p $filepath


###
###  torrent download finished Send the mail...
###

sendmsgmail(){


#config_get from_address $1 from_address
#echo "From: ${from_address}"
#config_get use_enable $1  use_enable 0
#config_get address $1 address
from_address=openwrtrouter@qq.com
address=maxjove@139.com



#if [ "$use_enable" == "1" ];then
#from_address=$(uci get email.@emailserver[0].from_address)
echo "From: ${from_address}" > $filepath/sendmailmsg
echo "Subject: $Subject"  >>$filepath/sendmailmsg
echo -e "To: ${address} \n" >>$filepath/sendmailmsg
#echo -e " \n" >>$filepath/sendmailmsg
echo -e "$msg"  >> $filepath/sendmailmsg
$sendmail $address < $filepath/sendmailmsg
#fi


}

#config_load email
#config_foreach sendmsgmail mail_address
sendmsgmail
rm -rf $filepath/sendmailmsg
exit 0
###
###  Send the mail finished
###


