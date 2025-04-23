# Apache Cassandra Installer for Ubuntu

This project automates the installation and setup of Apache Cassandra on Ubuntu (20.04+). It installs Cassandra manually from Apache’s official tarball and registers it as a systemd service.

## 🚀 Features

- Downloads and sets up Cassandra 4.1.8
- Registers Cassandra as a systemd service
- Adds `cqlsh` to your PATH

## 📦 Requirements

- Ubuntu 20.04 or later
- Java 11 or Java 17
- sudo access

## ✨ Notes

- If you don't have Java already installed, run ./java_installer.sh to install the required version automatically.
- Installs to /opt/cassandra
- Sets environment variables in .bashrc
- Uses Type=simple with -f flag for clean systemd integration

## 🛠️ Installation

⚠️  Note: If you don't have Java installed, make sure to run the Java installer first:

```bash
./java_installer.sh
```
Then proceed with the Cassandra setup:

```bash
git clone https://github.com/AnarchyNinetyNine/cassandra-ubuntu-installer.git
cd cassandra-ubuntu-installer
./install.sh
```

## 🧰 Service Management

```bash
sudo systemctl start cassandra
sudo systemctl stop cassandra
sudo systemctl status cassandra
```

## 🛠 Cassandra CLI

```bash
cqlsh         # Starts Cassandra shell
nodetool status  # Checks node/ring status
```



