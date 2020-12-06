#!/bin/bash

# get packages
# wget https://github.com/arminc/clair-scanner/releases/download/v12/clair-scanner_linux_amd64
# wget https://github.com/jgsqware/clairctl/releases/download/v1.2.8/clairctl-linux-amd64


image=$1
shift

# get node ip
node_ip=$(ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*$/\1/p')

echo "Scanning image: $image"
./clair-scanner --ip ${node_ip} --report=logs/${image}.json --all --log=logs/${image}.log ${image}

echo "Creating html report"
./clairctl report ${image} --local

echo "Access report on:  http://${node_ip}:6061/"

