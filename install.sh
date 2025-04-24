#!/bin/bash

sudo apt update

echo "📥 Downloading Cassandra 4.1.8..."
wget https://dlcdn.apache.org/cassandra/4.1.8/apache-cassandra-4.1.8-bin.tar.gz
tar -xzf apache-cassandra-4.1.8-bin.tar.gz
sudo mv apache-cassandra-4.1.8 /opt/cassandra

echo "🔧 Adding Cassandra to PATH..."
echo "export CASSANDRA_HOME=/opt/cassandra" >> ~/.bashrc
echo "export PATH=\$PATH:\$CASSANDRA_HOME/bin" >> ~/.bashrc
sudo snap install cqlsh


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

source ~/.bashrc

echo "⚙️  One last thing to go. run the following command.."
echo ""
echo "source ~/.bashrc"
echo ""
echo "ℹ️  To run Cassandra manually, use:"
echo ""
echo "    /opt/cassandra/bin/cassandra -R"
echo ""
echo "✅ Installation complete!"
