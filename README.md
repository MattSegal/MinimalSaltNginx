# Minimal Salt Config for Nginx

This repo uses Salt + Vagrant to set up an nginx server on a Ubuntu VM. nginx serves a static HTML file.

Run the setup using
```
vagrant up
```

and then visit http://localhost:8080 to view the results

## Contents

`top.sls` - entry point for Salt config
`webserver/` - config for Nginx
`bootstrap/salt.sh` - installs Salt and configures it to run on a single node
`Vagrantfile` - configures VM using Vagrant CLI tool
