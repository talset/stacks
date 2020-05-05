#!/bin/bash -v

set -e

export ENV=${env}
export PROJECT=${project}

# tmp
curl https://github.com/talset.keys >> /home/admin/.ssh/authorized_keys
