#!/bin/bash

./xuez-cli getbalance > balance_c.txt

sleep 119m

./xuez-cli getbalance > balance_d.txt

sleep 1s

wget http://xuez.donkeypool.com/api/getblockcount

sleep 1s

./xuez-cli getblockcount > getblockcountlocal.txt

c=$(cat balance_c.txt)
d=$(cat balance_d.txt)
g=$(cat getblockcount)
h=$(cat getblockcountlocal.txt)

rm getblockcount
rm getblockcountlocal.txt

if [ "$c" == "$d" ]
then

{
        echo To: xxx@gmail.com
#       echo From: from_email@example.com
        echo Subject: Xuez rewards failure
        echo 'You have had no Xuez rewards in the last 2 hours'
        echo 'Donkeypool block is' "$g"
        echo 'Local block is' "$h"

} | /usr/sbin/ssmtp xxxx@gmail.com
fi
