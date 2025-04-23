#!/bin/bash

set -e

sudo apt update

echo "📥 Downloading Cassandra 4.1.8..."
wget https://dlcdn.apache.org/cassandra/4.1.8/apache-cassandra-4.1.8-bin.tar.gz
tar -xzf apache-cassandra-4.1.8-bin.tar.gz
sudo mv apache-cassandra-4.1.8 /opt/cassandra

echo "🔧 Adding Cassandra to PATH..."
echo "export CASSANDRA_HOME=/opt/cassandra" >> ~/.bashrc
echo "export PATH=\$PATH:\$CASSANDRA_HOME/bin" >> ~/.bashrc
source ~/.bashrc

echo "⚙️  Registering systemd service..."
USER=$(whoami)

cat << EOF | sudo tee /etc/systemd/system/cassandra.service
[Unit]
Description=Apache Cassandra
After=network.target

[Service]
Type=simple
User=$USER
ExecStart=/opt/cassandra/bin/cassandra -f
Restart=always
LimitNOFILE=100000

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart cassandra
sudo systemctl enable cassandra

echo "✅ Installation complete! Use 'sudo systemctl start cassandra' to launch Cassandra."
