# 🚀 Apache Cassandra Installer for Ubuntu

Welcome to the **Apache Cassandra Installer for Ubuntu**! This project provides a robust, automated solution for installing and configuring **Apache Cassandra** on **Ubuntu 20.04+**. By leveraging official Apache tarballs and systemd integration, it ensures a reliable, production-ready setup for developers, data engineers, and database administrators.

---

## 🎯 Features

- **Automated Installation**: Downloads and configures **Apache Cassandra 4.1.8** with minimal user intervention.
- **Systemd Integration**: Registers Cassandra as a systemd service for seamless management.
- **CLI Accessibility**: Adds `cqlsh` and other Cassandra tools to your PATH for easy access.
- **Clean Setup**: Installs to `/opt/cassandra` for consistency and organization.
- **Environment Configuration**: Automatically sets environment variables in `~/.bashrc`.
- **Flexible Java Support**: Compatible with **Java 11** or **Java 17**, with an included Java installer.

---

## 📋 Prerequisites

- **Operating System**: Ubuntu 20.04 or later.
- **Java**: OpenJDK 11 or 17 (install via `java_installer.sh` if not already present).
- **Permissions**: `sudo` access for installing dependencies and managing services.
- **Internet**: Required for downloading Cassandra and Java packages.

---

## 📦 What's Included

- **`java_installer.sh`**: Installs **OpenJDK 11** and configures `JAVA_HOME` if Java is not already installed.
- **`install.sh`**: Downloads, extracts, and configures **Apache Cassandra 4.1.8**, sets environment variables, and registers Cassandra as a systemd service.

---

## 🛠️ Installation Guide

Follow these steps to set up Apache Cassandra on your Ubuntu system.

### 1. Install Java (if needed)

If Java 11 or 17 is not already installed, run:

```bash
./java_installer.sh
```

This script:
- Installs **OpenJDK 11**.
- Configures `JAVA_HOME` and updates `~/.bashrc`.

Verify Java installation:

```bash
java -version
```

### 2. Clone the Repository

```bash
git clone https://github.com/AnarchyNinetyNine/cassandra-ubuntu-installer.git
cd cassandra-ubuntu-installer
```

### 3. Install Cassandra

Run the installation script:

```bash
./install.sh
```
Uo next,run:
```bash
source ~/.bashrc
```

This script:
- Downloads **Apache Cassandra 4.1.8** from the official Apache repository.
- Extracts and installs it to `/opt/cassandra`.
- Configures environment variables in `~/.bashrc` for `cqlsh` and other tools.
- Sets up Cassandra as a systemd service with `Type=simple` and the `-f` flag for foreground execution.

### 4. Verify Installation

Check the Cassandra version:

```bash
cqlsh --version
```

Expected output: `cqlsh 5.0.1` (bundled with Cassandra 4.1.8).

---

## 🏃‍♂️ Managing the Cassandra Service

Cassandra is registered as a systemd service for easy management.

###💡 WSL (Windows Subsystem for Linux) Users: Special Note
If you're using **WSL1** or **WSL2**, the default **systemctl** commands for managing Cassandra won’t work, because **systemd** is not natively supported (unless manually enabled in **WSL2** with newer U>

### ✅ Instead of using:
```bash
sudo systemctl start cassandra
```
❗ Use this command to run Cassandra in the foreground:
```bash
/opt/cassandra/bin/cassandra -R
```

-The -R flag prevents Cassandra from daemonizing, which is more reliable in WSL environments.
- You can open a separate terminal tab and run Cassandra there, leaving it open.
- Once running, use cqlsh in another terminal to start querying:
```bash
cqlsh
```
### 🔄 Need to stop Cassandra?
Just press **Ctrl+C** in the terminal where Cassandra is running.

### 🖥️ If You Are Working with Native Ubuntu
If you're using a native Ubuntu installation (not WSL), you can manage Cassandra using systemd:
 
### 1. Start the Service

```bash
sudo systemctl start cassandra
```
### 2. Enable on Boot

To ensure Cassandra starts automatically on system boot:

```bash
sudo systemctl enable cassandra
```

### 3. Check Service Status

Verify that Cassandra is running:

```bash
sudo systemctl status cassandra
```

### 4. Stop the Service (Optional)

```bash
sudo systemctl stop cassandra
```

---

## 🛠️ Using Cassandra Tools

Interact with your Cassandra cluster using the included command-line tools:

- **CQL Shell**:

```bash
cqlsh
```

This starts the Cassandra Query Language (CQL) shell for executing queries.

- **Node Status**:

```bash
nodetool status
```

This checks the status of the Cassandra node and ring.

---

## 🔍 Troubleshooting

- **Java not found**: Ensure `JAVA_HOME` is set in `~/.bashrc`. Run `source ~/.bashrc` after executing `java_installer.sh`.
- **Cassandra service fails to start**: Check logs in `/opt/cassandra/logs/` or use `sudo journalctl -u cassandra` for errors.
- **Port conflicts**: Verify that ports 9042 (CQL) and 7000/7001 (internode communication) are free using `netstat -tuln`.
- **Permission issues**: Ensure the Cassandra directory (`/opt/cassandra`) is owned by the appropriate user (e.g., `sudo chown -R $USER /opt/cassandra`).

For advanced troubleshooting, refer to the [Apache Cassandra documentation](https://cassandra.apache.org/doc/latest/).

---

## 🛠️ Customizing the Setup

- **Configuration**: Modify Cassandra settings in `/opt/cassandra/conf/cassandra.yaml` (e.g., cluster name, listen address).
- **Logging**: Adjust logging levels in `/opt/cassandra/conf/logback.xml`.
- **Multi-Node Clusters**: Extend the setup by configuring additional nodes and updating `cassandra.yaml` with seed node addresses.

---

## 🤝 Contributing

We welcome contributions to improve this project! To contribute:

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m "Add YourFeature"`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a Pull Request.

Please include clear documentation and ensure compatibility with Ubuntu 20.04+.

---

## 📜 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙌 Acknowledgments

- [Apache Cassandra](https://cassandra.apache.org/) community for their powerful NoSQL database.
- Ubuntu developers for providing a robust platform for deployment.

---

## 📬 Contact

For questions, bug reports, or suggestions, please open an issue on the [GitHub repository](https://github.com/AnarchyNinetyNine/cassandra-ubuntu-installer/issues) or contact the maintainer **Idris Elgarrab** at [franckenstein999@.com].

Happy querying with Cassandra! 🚀
