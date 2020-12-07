#!/bin/bash


# get node ip
node_ip=$(ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*$/\1/p')

running_images=$(docker ps --all | tail -n +2 | awk '{print $2}' | sort | uniq)

for image in $running_images; do

    echo "Scanning image: $image"
    clean_image_name=$(echo $image | tr '/' '_' | tr ':' '_' )

    ./clair-scanner --ip ${node_ip} --report=logs/${clean_image_name}.json --all --log=logs/${clean_image_name}.log "${image}"

    echo "Creating html report"
    ./clairctl report ${image} --local

done

echo "Access reports on:  http://${node_ip}:6061/"
