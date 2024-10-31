# WiltonDB APT Mirror

This repo is a mirror/subset of WiltonDB ppa repo: https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/

- Arch: amd64, arm64
- Distro: noble, jammy, focal


## Create Mirror

How to mirror mssql repo

```bash
sudo apt install apt-mirror
sudo tee /etc/apt/mirror.list > /dev/null <<EOF
set defaultarch amd64 arm64
deb [trusted=yes arch=amd64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ $(lsb_release -cs) main
deb [trusted=yes arch=arm64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ $(lsb_release -cs) main
clean http://ppa.launchpad.net/wiltondb/wiltondb/ubuntu
EOF
sudo apt-mirror
ncdu /var/spool/apt-mirror/mirror/ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/
```



## Build Mirror

```bash
sudo apt install apt-mirror
sudo tee /etc/apt/mirror.list > /dev/null <<EOF
set defaultarch amd64 arm64
deb [trusted=yes arch=amd64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ noble main
deb [trusted=yes arch=arm64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ noble main
deb [trusted=yes arch=amd64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ jammy main
deb [trusted=yes arch=arm64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ jammy main
deb [trusted=yes arch=amd64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ focal main
deb [trusted=yes arch=arm64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ focal main

clean http://ppa.launchpad.net/wiltondb/wiltondb/ubuntu
EOF
sudo apt-mirror
ncdu /var/spool/apt-mirror/mirror/ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/
```

```bash
cd /data/pkg/apt/mssql
scp -r 10.10.10.10:/var/spool/apt-mirror/mirror/ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/* ./
```