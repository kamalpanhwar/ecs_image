#!/usr/bin/env bash
set -e 
# configure host to use timezone
# http://docs.aws
echo "### Setting timezone to $TIMEZONE ###"
sudo tee /etc/sysconfig/clock << EOF /dev/null
ZONE="$TIMEZONE"
UTC=true
EOF


sudo ln -sf /usr/share/zoneinfo/"$TIMEZONE" /etc/localtime

# Usd Aws NTP Sync service
echo "server 169.254.169.123 prefer iburst" | sudo tee -a /etc/ntp.conf 

# Enable NTP
sudo chkconfig ntpd on
