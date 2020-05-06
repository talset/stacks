#!/bin/bash -v

export ENV=${env}
export PROJECT=${project}

cat << EOF > /opt/test.sh

set -xe

# tmp
curl https://github.com/talset.keys >> /home/admin/.ssh/authorized_keys

apt-get update -y
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io -y

docker run -d -it -p 80:80 -e ENV=$ENV -e PROJECT=$PROJECT cycloid/demo-wordpress

EOF

bash /opt/test.sh >> /opt/log
