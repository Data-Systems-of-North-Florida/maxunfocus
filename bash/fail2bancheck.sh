#!/bin/bash
echo "Checking log file for banned IPs"
zgrep 'Ban:' /var/log/fail2ban.log*
exit 0
