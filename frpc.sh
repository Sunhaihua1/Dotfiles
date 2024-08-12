#! /bin/bash

tar -zxvf frp.tar.gz 


echo 'serverAddr = "81.69.202.169"
serverPort = '7039'

[[proxies]]
name = "ssh_rk3588"
type = "tcp"
localIP = "127.0.0.1"
localPort = 22
remotePort = 8100' > ./frp_0.52.3_linux_arm64/frpc.toml

sudo cp -r ./frp_0.52.3_linux_arm64 /opt/frp

echo '
[Unit]
Description=frpc client
After=network.target
Wants=network.target

[Service]
Restart=on-failure
RestartSec=5

ExecStart=/opt/frp/frpc -c /opt/frp/frpc.toml

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/frpc.service

sudo systemctl enable frpc

sudo systemctl start frpc
