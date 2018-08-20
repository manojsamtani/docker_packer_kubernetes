#!/bin/bash
echo "Installing Flask dependencies"
apt-get update && \
    apt-get install -y python python-pip && \
    apt-get clean all

pip install flask
