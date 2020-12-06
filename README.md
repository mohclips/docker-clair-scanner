# Clair container scanner

This builds upon Armin Coralic's work.
https://github.com/arminc/clair-scanner

# Dependancies

## images

- arminc/clair-db
- arminc/clair-local-scan
- nginx:alpine

## CLI commands 
These are run on the node that hosts the images.

- clair-scanner `wget https://github.com/arminc/clair-scanner/releases/download/v12/clair-scanner_linux_amd64`
- clairctl `wget https://github.com/jgsqware/clairctl/releases/download/v1.2.8/clairctl-linux-amd64`

# How to use

There is a `run.sh` script that can be run on the node that contains the images.

You will need your local node IP address, this is a requirement to get clair-scanner to talk to the clair-db.

## Process

- get local ip of node
- run clair scanner (scan is dumped to console and cab be saved as json)
- run clair control (to produce a html report)

# Reports

Reports are saved the local node, these are accessible from the nginx container.

`http://<local node ip>:6061/`

This just a directory listing on the html reports. Nothing fancy. :)




Have fun!

