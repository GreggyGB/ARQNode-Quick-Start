
# ArQmA service node easy setup guide

ARQNode requires min Ubuntu 20.04

## Installation

### ALL-IN-ONE installation
`apt install git && git clone https://github.com/GreggyGB/ARQNode-Quick-Start arqma && cd ~/arqma && bash arqma.sh install`

### Pull this script from github
`git clone https://github.com/malbit/arqma arqma`

### Go into newly created folder

`cd arqma`

### Run install script

`bash arqma.sh install`

### To start service node

`bash arqma.sh start`

## Additional commands:

### To check service status:

`bash arqma.sh status`

### To check how it is working:

`bash arqma.sh log`

### To generate staking transaction:

`bash arqma.sh prepare_sn`

### To upgrade node to latest version:

`bash arqma.sh update`
 then
`bash arqma.sh fork_update`

