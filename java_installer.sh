
#!/bin/bash

# java_installer.sh - Installs OpenJDK 11 and sets JAVA_HOME

echo "Checking if Java is already installed..."
if type -p java; then
    echo "Java found: $(java -version 2>&1 | head -n 1)"
else
    echo "Java not found. Installing OpenJDK 11..."
    sudo apt update
    sudo apt install openjdk-11-jdk -y

    echo "Locating JAVA_HOME..."
    JAVA_PATH=$(readlink -f $(which java))
    JAVA_HOME_DIR=$(dirname $(dirname $JAVA_PATH))

    echo "Exporting JAVA_HOME..."
    echo "export JAVA_HOME=$JAVA_HOME_DIR" >> ~/.bashrc
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc

    # Also export for current session
    export JAVA_HOME=$JAVA_HOME_DIR
    export PATH=$JAVA_HOME/bin:$PATH

    echo "JAVA_HOME is set to: $JAVA_HOME"
    echo "Verifying installation..."
    java -version
fi
