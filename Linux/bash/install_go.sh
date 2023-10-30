#!/bin/bash

# Langkah 1: Unduh file instalasi Golang
wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz

# Langkah 2: Ekstrak file instalasi Golang
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz

# Langkah 3: Tambahkan variabel lingkungan Golang ke .bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc

# Langkah 4: Muat ulang .bashrc
source ~/.bashrc

# Langkah 5: Hapus file instalasi yang sudah diunduh
rm go1.21.0.linux-amd64.tar.gz

echo "Instalasi Golang selesai."
