#!/bin/bash

wget http://xuez.donkeypool.com/api/getblockcount

sleep 1s

./xuez-cli getblockcount > getblockcountlocal.txt

sleep 1s

./xuez-cli getbalance > balance_b.txt

sleep 1s

a=$(cat balance_a.txt)
b=$(cat balance_b.txt)
g=$(cat getblockcount)
h=$(cat getblockcountlocal.txt)

rm getblockcount
rm getblockcountlocal.txt

sleep 1s

if [ "$b" \> "$a" ]
then
       ./xuez-cli getbalance > balance_a.txt

        sleep 1s

        {
        echo To: xxxx@gmail.com
#       echo From: from_email@example.com
        echo Subject: Xuez Block Status
        echo 'Donkeypool block is' "$g"
        echo 'Local block is' "$h"
        echo 'You have earned'
        echo "$b - $a" | bc
        echo 'in the last 24 hours'
        echo 'Your current balance is' "$b"
        } | /usr/sbin/ssmtp xxx@gmail.com
fi
