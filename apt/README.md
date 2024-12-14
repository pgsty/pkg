# PGSTY APT Repository

This repo contains supplementary packages for the official [PGDG APT](https://download.postgresql.org/pub/repos/apt/) repo.


--------

## How to sync upstream repo?

```bash
sudo apt install apt-mirror
```


## WiltonDB Repo

```bash
sudo tee /etc/apt/mirror.list > /dev/null <<EOF
set defaultarch amd64 arm64
deb [trusted=yes arch=amd64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ noble main
deb [trusted=yes arch=arm64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ noble main
deb [trusted=yes arch=amd64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ jammy main
deb [trusted=yes arch=arm64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ jammy main
deb [trusted=yes arch=amd64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ focal main
deb [trusted=yes arch=arm64] https://ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ focal main
clean https://ppa.launchpad.net/wiltondb/wiltondb/ubuntu
EOF
sudo apt-mirror
```

Rsync to local

```bash
cd /data/pkg/apt/;
rsync -avz u22:/var/spool/apt-mirror/mirror/ppa.launchpadcontent.net/wiltondb/wiltondb/ubuntu/ mssql/
```

Keep the repo intact and serve it directly



--------------

## HAPROXY Repo

```bash
sudo tee /etc/apt/mirror.list > /dev/null <<EOF
set defaultarch amd64 arm64
deb [trusted=yes arch=amd64] https://ppa.launchpadcontent.net/vbernat/haproxy-3.0/ubuntu/ noble main
deb [trusted=yes arch=arm64] https://ppa.launchpadcontent.net/vbernat/haproxy-3.0/ubuntu/ noble main
deb [trusted=yes arch=amd64] https://ppa.launchpadcontent.net/vbernat/haproxy-3.0/ubuntu/ jammy main
deb [trusted=yes arch=arm64] https://ppa.launchpadcontent.net/vbernat/haproxy-3.0/ubuntu/ jammy main
deb [trusted=yes arch=amd64] https://ppa.launchpadcontent.net/vbernat/haproxy-3.0/ubuntu/ focal main
deb [trusted=yes arch=arm64] https://ppa.launchpadcontent.net/vbernat/haproxy-3.0/ubuntu/ focal main
deb [trusted=yes arch=amd64] http://haproxy.debian.net/ bookworm-backports-3.0 main
deb [trusted=yes arch=arm64] http://haproxy.debian.net/ bookworm-backports-3.0 main
deb [trusted=yes arch=amd64] http://haproxy.debian.net/ bullseye-backports-3.0 main
deb [trusted=yes arch=arm64] http://haproxy.debian.net/ bullseye-backports-3.0 main
clean https://ppa.launchpad.net/vbernat/haproxy-3.0/ubuntu
clean http://haproxy.debian.net/
EOF
sudo apt-mirror
ncdu /var/spool/apt-mirror/mirror/ppa.launchpadcontent.net/vbernat/haproxy-3.0/ubuntu/
ncdu /var/spool/apt-mirror/mirror/haproxy.debian.net/
```

Rsync to local

```bash
cd /data/pkg/apt/; mkdir -p haproxy haproxy/ubuntu haproxy/debian
rsync -avz u24:/var/spool/apt-mirror/mirror/ppa.launchpadcontent.net/vbernat/haproxy-3.0/ubuntu/ haproxy/ubuntu
rsync -avz u24:/var/spool/apt-mirror/mirror/haproxy.debian.net/ haproxy/debian


rsync -avz u24:/var/spool/apt-mirror/mirror/ppa.launchpadcontent.net/vbernat/haproxy-3.0/ubuntu/ haproxy/ubuntu
rsync -avz u24:/var/spool/apt-mirror/mirror/haproxy.debian.net/ haproxy/debian
```

Collect the latest haproxy deb

```bash
cp haproxy/debian/pool/main/h/haproxy/haproxy_3.1.0-2~bpo11+1_amd64.deb   /tmp/apt/bullseye/
cp haproxy/debian/pool/main/h/haproxy/haproxy_3.1.0-2~bpo11+1_arm64.deb   /tmp/apt/bullseye/
cp haproxy/debian/pool/main/h/haproxy/haproxy_3.1.0-2~bpo12+1_amd64.deb   /tmp/apt/bookworm/
cp haproxy/debian/pool/main/h/haproxy/haproxy_3.1.0-2~bpo12+1_arm64.deb   /tmp/apt/bookworm/
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.1.0-1ppa1~jammy_amd64.deb /tmp/apt/jammy/
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.1.0-1ppa1~jammy_arm64.deb /tmp/apt/jammy/
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.1.0-1ppa1~noble_amd64.deb /tmp/apt/noble/
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.1.0-1ppa1~noble_arm64.deb /tmp/apt/noble/
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.1.0-1ppa2~focal_amd64.deb /tmp/apt/focal/
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.1.0-1ppa2~focal_arm64.deb /tmp/apt/focal/
```




--------------

## Redis Repo

```bash
sudo tee /etc/apt/mirror.list > /dev/null <<EOF
set defaultarch amd64 arm64
deb [trusted=yes arch=amd64] https://packages.redis.io/deb noble main
deb [trusted=yes arch=arm64] https://packages.redis.io/deb noble main
deb [trusted=yes arch=amd64] https://packages.redis.io/deb jammy main
deb [trusted=yes arch=arm64] https://packages.redis.io/deb jammy main
deb [trusted=yes arch=amd64] https://packages.redis.io/deb focal main
deb [trusted=yes arch=arm64] https://packages.redis.io/deb focal main
deb [trusted=yes arch=amd64] https://packages.redis.io/deb bookworm main
deb [trusted=yes arch=arm64] https://packages.redis.io/deb bookworm main
deb [trusted=yes arch=amd64] https://packages.redis.io/deb bullseye main
deb [trusted=yes arch=arm64] https://packages.redis.io/deb bullseye main
clean http://packages.redis.io/deb
EOF
sudo apt-mirror
ncdu /var/spool/apt-mirror/mirror/packages.redis.io/deb 
```

Rsync to local

```bash
cd /data/pkg/apt/; mkdir -p redis
rsync -avz u24:/var/spool/apt-mirror/mirror/packages.redis.io/deb redis/
```

Collect the latest redis deb

```bash
cp redis/deb/pool/jammy/r/re/redis*7.2.5*    pgsql/jammy/stash/
cp redis/deb/pool/noble/r/re/redis*7.2.5*    pgsql/noble/stash/
cp redis/deb/pool/focal/r/re/redis*7.2.5*    pgsql/focal/stash/
cp redis/deb/pool/bookworm/r/re/redis*7.2.5* pgsql/bookworm/stash/
cp redis/deb/pool/bullseye/r/re/redis*7.2.5* pgsql/bullseye/stash/
```



------------------------

## Citus Repo

```bash
sudo tee /etc/apt/mirror.list > /dev/null <<EOF
set defaultarch amd64 arm64
deb [trusted=yes arch=amd64] https://packagecloud.io/citusdata/community/ubuntu noble main
deb [trusted=yes arch=arm64] https://packagecloud.io/citusdata/community/ubuntu noble main
deb [trusted=yes arch=amd64] https://packagecloud.io/citusdata/community/ubuntu jammy main
deb [trusted=yes arch=arm64] https://packagecloud.io/citusdata/community/ubuntu jammy main
deb [trusted=yes arch=amd64] https://packagecloud.io/citusdata/community/ubuntu focal main
deb [trusted=yes arch=arm64] https://packagecloud.io/citusdata/community/ubuntu focal main
deb [trusted=yes arch=amd64] https://packagecloud.io/citusdata/community/debian bookworm main
deb [trusted=yes arch=arm64] https://packagecloud.io/citusdata/community/debian bookworm main
deb [trusted=yes arch=amd64] https://packagecloud.io/citusdata/community/debian bullseye main
deb [trusted=yes arch=arm64] https://packagecloud.io/citusdata/community/debian bullseye main
clean http://packagecloud.io/citusdata/community/ubuntu
clean http://packagecloud.io/citusdata/community/debian
EOF
sudo apt-mirror

ncdu /var/spool/apt-mirror/mirror/packagecloud.io/citusdata/community/ubuntu
ncdu /var/spool/apt-mirror/mirror/packagecloud.io/citusdata/community/debian
```

```bash
cd /data/pkg/apt/; mkdir -p citus citus/ubuntu citus/debian
rsync -avz u24:/var/spool/apt-mirror/mirror/packagecloud.io/citusdata/community/ubuntu/ citus/ubuntu/
rsync -avz u24:/var/spool/apt-mirror/mirror/packagecloud.io/citusdata/community/debian/ citus/debian/
```

No ARM64, No noble, No PG17

```bash
cp -f citus/debian/pool/bookworm/main/p/citus/{postgresql-*-citus-12.1_12.1.5*.deb,postgresql-12-citus-10.2_10.2.9*.deb,postgresql-13-citus-11.3_11.3.1.citus-1_amd64.deb}  pgsql/bookworm/stash/
cp -f citus/debian/pool/bullseye/main/p/citus/{postgresql-*-citus-12.1_12.1.5*.deb,postgresql-12-citus-10.2_10.2.9*.deb,postgresql-13-citus-11.3_11.3.1.citus-1_amd64.deb}  pgsql/bullseye/stash/
cp -f citus/ubuntu/pool/jammy/main/p/citus/{postgresql-*-citus-12.1_12.1.5*.deb,postgresql-12-citus-10.2_10.2.9*.deb,postgresql-13-citus-11.3_11.3.1.citus-1_amd64.deb}     pgsql/jammy/stash/
cp -f citus/ubuntu/pool/focal/main/p/citus/{postgresql-*-citus-12.1_12.1.5*.deb,postgresql-12-citus-10.2_10.2.9*.deb,postgresql-13-citus-11.3_11.3.1.citus-1_amd64.deb}     pgsql/focal/stash/

cp citus/debian/pool/bookworm/main/p/citus/postgresql-*-citus-12.1_12.1.6*.deb  pgsql/bookworm/stash/
cp citus/debian/pool/bullseye/main/p/citus/postgresql-*-citus-12.1_12.1.6*.deb  pgsql/bullseye/stash/
cp citus/ubuntu/pool/jammy/main/p/citus/postgresql-*-citus-12.1_12.1.5*.deb     pgsql/jammy/stash/
cp citus/ubuntu/pool/focal/main/p/citus/postgresql-*-citus-12.1_12.1.5*.deb     pgsql/focal/stash/
#cp citus/ubuntu/pool/focal/main/p/citus/postgresql-*-citus-12.1_12.1.5*.deb    pgsql/noble/stash/ # not supported yet

```



```bash
ls pgsql/bookworm/stash/ pgsql/bullseye/stash/ pgsql/jammy/stash/ pgsql/focal/stash/ pgsql/noble/stash/ 
```


------------------------

## Timescale Repo


```bash
sudo tee /etc/apt/mirror.list > /dev/null <<EOF
set defaultarch amd64 arm64
deb [trusted=yes arch=amd64] https://packagecloud.io/timescale/timescaledb/ubuntu noble main
deb [trusted=yes arch=arm64] https://packagecloud.io/timescale/timescaledb/ubuntu noble main
deb [trusted=yes arch=amd64] https://packagecloud.io/timescale/timescaledb/ubuntu jammy main
deb [trusted=yes arch=arm64] https://packagecloud.io/timescale/timescaledb/ubuntu jammy main
deb [trusted=yes arch=amd64] https://packagecloud.io/timescale/timescaledb/ubuntu focal main
deb [trusted=yes arch=arm64] https://packagecloud.io/timescale/timescaledb/ubuntu focal main
deb [trusted=yes arch=amd64] https://packagecloud.io/timescale/timescaledb/debian bookworm main
deb [trusted=yes arch=arm64] https://packagecloud.io/timescale/timescaledb/debian bookworm main
deb [trusted=yes arch=amd64] https://packagecloud.io/timescale/timescaledb/debian bullseye main
deb [trusted=yes arch=arm64] https://packagecloud.io/timescale/timescaledb/debian bullseye main
clean https://packagecloud.io/timescale/timescaledb/ubuntu
clean https://packagecloud.io/timescale/timescaledb/debian
EOF
sudo apt-mirror

ncdu /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu
ncdu /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian
```


```bash
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/jammy/main/t/
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bookworm/main/t/

# main extensions
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/jammy/main/t/{timescaledb-2-2.17.2-postgresql-17,timescaledb-2-2.17.2-postgresql-16,timescaledb-2-2.17.2-postgresql-15,timescaledb-2-2.17.2-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/focal/main/t/{timescaledb-2-2.17.2-postgresql-17,timescaledb-2-2.17.2-postgresql-16,timescaledb-2-2.17.2-postgresql-15,timescaledb-2-2.17.2-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/noble/main/t/{timescaledb-2-2.17.2-postgresql-17,timescaledb-2-2.17.2-postgresql-16,timescaledb-2-2.17.2-postgresql-15,timescaledb-2-2.17.2-postgresql-14,timescaledb-2-2.15.3-postgresql-13}
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bookworm/main/t/{timescaledb-2-2.17.2-postgresql-17,timescaledb-2-2.17.2-postgresql-16,timescaledb-2-2.17.2-postgresql-15,timescaledb-2-2.17.2-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bullseye/main/t/{timescaledb-2-2.17.2-postgresql-17,timescaledb-2-2.17.2-postgresql-16,timescaledb-2-2.17.2-postgresql-15,timescaledb-2-2.17.2-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}

# timescaledb tools
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/jammy/main/t/timescaledb-tools/timescaledb-tools_0.17.2*.deb
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/focal/main/t/timescaledb-tools/timescaledb-tools_0.17.2*.deb
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/noble/main/t/timescaledb-tools/timescaledb-tools_0.17.2*.deb
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bookworm/main/t/timescaledb-tools/timescaledb-tools_0.17.2*.deb
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bullseye/main/t/timescaledb-tools/timescaledb-tools_0.17.2*.deb

ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/jammy/main/t/timescaledb-toolkit/timescaledb-toolkit-postgresql-1?_1.18.0*.deb
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/focal/main/t/timescaledb-toolkit/timescaledb-toolkit-postgresql-1?_1.18.0*.deb
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bookworm/main/t/timescaledb-toolkit/timescaledb-toolkit-postgresql-1?_1.18.0*.deb
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bullseye/main/t/timescaledb-toolkit/timescaledb-toolkit-postgresql-1?_1.18.0*.deb
# ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/noble/main/t/timescaledb-toolkit/timescaledb-toolkit-postgresql-1?_1.18.0*.deb not ready yet
```

```bash
cd /tmp; mkdir -p pgsql/ pgsql/jammy pgsql/focal pgsql/noble pgsql/bookworm pgsql/bullseye; cd /tmp/pgsql/;

# main ext
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/jammy/main/t/{timescaledb-2-2.17.2-postgresql-17,timescaledb-2-2.17.2-postgresql-16,timescaledb-2-2.17.2-postgresql-15,timescaledb-2-2.17.2-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}/*      jammy/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/focal/main/t/{timescaledb-2-2.17.2-postgresql-17,timescaledb-2-2.17.2-postgresql-16,timescaledb-2-2.17.2-postgresql-15,timescaledb-2-2.17.2-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}/*      focal/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/noble/main/t/{timescaledb-2-2.17.2-postgresql-17,timescaledb-2-2.17.2-postgresql-16,timescaledb-2-2.17.2-postgresql-15,timescaledb-2-2.17.2-postgresql-14,timescaledb-2-2.15.3-postgresql-13}/*                                         noble/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bookworm/main/t/{timescaledb-2-2.17.2-postgresql-17,timescaledb-2-2.17.2-postgresql-16,timescaledb-2-2.17.2-postgresql-15,timescaledb-2-2.17.2-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}/*   bookworm/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bullseye/main/t/{timescaledb-2-2.17.2-postgresql-17,timescaledb-2-2.17.2-postgresql-16,timescaledb-2-2.17.2-postgresql-15,timescaledb-2-2.17.2-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}/*   bullseye/

# timescaledb tools
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/jammy/main/t/timescaledb-tools/timescaledb-tools_0.17.2*.deb    jammy/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/focal/main/t/timescaledb-tools/timescaledb-tools_0.17.2*.deb    focal/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/noble/main/t/timescaledb-tools/timescaledb-tools_0.17.2*.deb    noble/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bookworm/main/t/timescaledb-tools/timescaledb-tools_0.17.2*.deb bookworm/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bullseye/main/t/timescaledb-tools/timescaledb-tools_0.17.2*.deb bullseye/

# timescaledb toolkit
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/jammy/main/t/timescaledb-toolkit/timescaledb-toolkit-postgresql-1?_1.18.0*.deb     jammy/
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/focal/main/t/timescaledb-toolkit/timescaledb-toolkit-postgresql-1?_1.18.0*.deb     focal/
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bookworm/main/t/timescaledb-toolkit/timescaledb-toolkit-postgresql-1?_1.18.0*.deb  bookworm/
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bullseye/main/t/timescaledb-toolkit/timescaledb-toolkit-postgresql-1?_1.18.0*.deb  bullseye/
```

```bash
cp timescale/jammy/*    pgsql/jammy/stash/
cp timescale/noble/*    pgsql/noble/stash/
cp timescale/focal/*    pgsql/focal/stash/
cp timescale/bookworm/* pgsql/bookworm/stash/
cp timescale/bullseye/* pgsql/bullseye/stash/
```




```bash
ll pgsql/*/stash
```



## Pull back


```bash
scp -r d12:/var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb .
scp -r u22:/var/spool/apt-mirror/mirror/packagecloud.io/citusdata/community citus
scp -r u22:/var/spool/apt-mirror/mirror/packages.redis.io/deb/pool redis
scp -r u24:/var/spool/apt-mirror/mirror/ppa.launchpadcontent.net/wiltondb/wiltondb .
scp -r u24:/var/spool/apt-mirror/mirror/ppa.launchpadcontent.net/vbernat/haproxy-3.0/ubuntu haproxy/ubuntu
scp -r u24:/var/spool/apt-mirror/mirror/haproxy.debian.net/ haproxy/debian
```

```bash
mkdir -p /data/apt/{bookworm,bullseye,jammy,focal,noble}

# find and copy redis
find redis -name redis*7.2.6*bookworm*.deb -exec cp {} /data/apt/bookworm/ \;
find redis -name redis*7.2.6*bullseye*.deb -exec cp {} /data/apt/bullseye/ \;
find redis -name redis*7.2.6*noble*.deb    -exec cp {} /data/apt/noble/ \;
find redis -name redis*7.2.6*focal*.deb    -exec cp {} /data/apt/focal/ \;
find redis -name redis*7.2.6*jammy*.deb    -exec cp {} /data/apt/jammy/ \;

# find and copy haproxy
find haproxy -name haproxy_3.1.0*bpo12*.deb -exec cp {} /data/apt/bookworm/ \;
find haproxy -name haproxy_3.1.0*bpo11*.deb -exec cp {} /data/apt/bullseye/ \;
find haproxy -name haproxy_3.0.6*noble*.deb    -exec cp {} /data/apt/noble/ \;
find haproxy -name haproxy_3.0.6*focal*.deb    -exec cp {} /data/apt/focal/ \;
find haproxy -name haproxy_3.0.6*jammy*.deb    -exec cp {} /data/apt/jammy/ \;

# find and copy citus (no arm64, no17, no noble)
cp citus/debian/pool/bookworm/main/p/citus/{postgresql-*-citus-12.1_12.1.6*.deb,postgresql-12-citus-10.2_10.2.9*.deb,postgresql-13-citus-11.3_11.3.1.citus-1_amd64.deb}  /data/apt/bookworm/
cp citus/debian/pool/bullseye/main/p/citus/{postgresql-*-citus-12.1_12.1.6*.deb,postgresql-12-citus-10.2_10.2.9*.deb,postgresql-13-citus-11.3_11.3.1.citus-1_amd64.deb}  /data/apt/bullseye/
cp citus/ubuntu/pool/jammy/main/p/citus/{postgresql-*-citus-12.1_12.1.6*.deb,postgresql-12-citus-10.2_10.2.9*.deb,postgresql-13-citus-11.3_11.3.1.citus-1_amd64.deb}     /data/apt/jammy/
cp citus/ubuntu/pool/focal/main/p/citus/{postgresql-*-citus-12.1_12.1.6*.deb,postgresql-12-citus-10.2_10.2.9*.deb,postgresql-13-citus-11.3_11.3.1.citus-1_amd64.deb}     /data/apt/focal/

find citus/debian/pool/bookworm/ -name postgresql-*-topn_2.6.0*.deb -exec cp {} /data/apt/bookworm/ \;
find citus/debian/pool/bullseye/ -name postgresql-*-topn_2.6.0*.deb -exec cp {} /data/apt/bullseye/ \;
find citus/ubuntu/pool/focal/ -name postgresql-*-topn_2.6.0*.deb    -exec cp {} /data/apt/focal/ \;
find citus/ubuntu/pool/jammy/ -name postgresql-*-topn_2.6.0*.deb    -exec cp {} /data/apt/jammy/ \;


# timescaledb
mkdir -p /data/apt/tmp
# tool are available for 5 deb distro
find timescaledb -name timescaledb-tools*0.18.0*               -exec cp {} /data/apt/tmp/ \;
# toolkit does not have ubuntu 24.04 support yet
find timescaledb -name timescaledb-toolkit*1.19.0*.deb         -exec cp {} /data/apt/tmp/ \;

find timescaledb -name timescaledb-2-2.17.2*.deb               -exec cp {} /data/apt/tmp/ \;
find timescaledb -name timescaledb-2-2.15.3-postgresql-13*.deb -exec cp {} /data/apt/tmp/ \;
find timescaledb -name timescaledb-2-2.11.2-postgresql-12*.deb -exec cp {} /data/apt/tmp/ \;

# loader missing debian 12 arm packages
find timescaledb -name timescaledb-2-loader-postgresql-*_2.17.2*.deb   -exec cp {} /data/apt/tmp/ \;
find timescaledb -name timescaledb-2-loader-postgresql-13_2.15.3*.deb  -exec cp {} /data/apt/tmp/ \;
find timescaledb -name timescaledb-2-loader-postgresql-12_2.11.2*.deb  -exec cp {} /data/apt/tmp/ \;


# main extensions
rm -rf /data/apt/tmp
mkdir /data/apt/tmp
cp timescaledb/ubuntu/pool/jammy/main/t/{timescaledb-2-postgresql-17,timescaledb-2-postgresql-16,timescaledb-2-postgresql-15,timescaledb-2-postgresql-14,timescaledb-2-postgresql-13,timescaledb-2-postgresql-12} /data/apt/ts
cp timescaledb/ubuntu/pool/focal/main/t/{timescaledb-2-postgresql-17,timescaledb-2-postgresql-16,timescaledb-2-postgresql-15,timescaledb-2-postgresql-14,timescaledb-2-postgresql-13,timescaledb-2-postgresql-12} /data/apt/ts
cp timescaledb/ubuntu/pool/noble/main/t/{timescaledb-2-postgresql-17,timescaledb-2-postgresql-16,timescaledb-2-postgresql-15,timescaledb-2-postgresql-14,timescaledb-2-postgresql-13}
cp timescaledb/debian/pool/bookworm/main/t/{timescaledb-2-postgresql-17,timescaledb-2-postgresql-16,timescaledb-2-postgresql-15,timescaledb-2-postgresql-14,timescaledb-2-postgresql-13,timescaledb-2-postgresql-12} /data/apt/ts
cp timescaledb/debian/pool/bullseye/main/t/{timescaledb-2-postgresql-17,timescaledb-2-postgresql-16,timescaledb-2-postgresql-15,timescaledb-2-postgresql-14,timescaledb-2-postgresql-13,timescaledb-2-postgresql-12} /data/apt/ts

cp timescaledb/debian/pool/bookworm/main/t/timescaledb-2-postgresql-17/*2.17.2*   /data/mirror/tmp
cp timescaledb/debian/pool/bookworm/main/t/timescaledb-2-postgresql-16/*2.17.2*   /data/mirror/tmp
cp timescaledb/debian/pool/bookworm/main/t/timescaledb-2-postgresql-15/*2.17.2*   /data/mirror/tmp
cp timescaledb/debian/pool/bookworm/main/t/timescaledb-2-postgresql-14/*2.17.2*   /data/mirror/tmp
cp timescaledb/debian/pool/bookworm/main/t/timescaledb-2-postgresql-13/*2.15.3*   /data/mirror/tmp
cp timescaledb/debian/pool/bookworm/main/t/timescaledb-2-postgresql-12/*2.11.2*   /data/mirror/tmp
 
cp timescaledb/debian/pool/bullseye/main/t/timescaledb-2-postgresql-17/*2.17.2*   /data/mirror/tmp
cp timescaledb/debian/pool/bullseye/main/t/timescaledb-2-postgresql-16/*2.17.2*   /data/mirror/tmp
cp timescaledb/debian/pool/bullseye/main/t/timescaledb-2-postgresql-15/*2.17.2*   /data/mirror/tmp
cp timescaledb/debian/pool/bullseye/main/t/timescaledb-2-postgresql-14/*2.17.2*   /data/mirror/tmp
cp timescaledb/debian/pool/bullseye/main/t/timescaledb-2-postgresql-13/*2.15.3*   /data/mirror/tmp
cp timescaledb/debian/pool/bullseye/main/t/timescaledb-2-postgresql-12/*2.11.2*   /data/mirror/tmp
   
cp timescaledb/ubuntu/pool/noble/main/t/timescaledb-2-postgresql-17/*2.17.2*   /data/mirror/tmp
cp timescaledb/ubuntu/pool/noble/main/t/timescaledb-2-postgresql-16/*2.17.2*   /data/mirror/tmp
cp timescaledb/ubuntu/pool/noble/main/t/timescaledb-2-postgresql-15/*2.17.2*   /data/mirror/tmp
cp timescaledb/ubuntu/pool/noble/main/t/timescaledb-2-postgresql-14/*2.17.2*   /data/mirror/tmp
cp timescaledb/ubuntu/pool/noble/main/t/timescaledb-2-postgresql-13/*2.15.3*   /data/mirror/tmp
cp timescaledb/ubuntu/pool/noble/main/t/timescaledb-2-postgresql-12/*2.11.2*   /data/mirror/tmp

# loader missing debian 12 arm packages
find timescaledb -name timescaledb-2-loader-postgresql-*_2.17.2*.deb   -exec cp {} /data/mirror/tmp/ \;
find timescaledb -name timescaledb-2-loader-postgresql-13_2.15.3*.deb  -exec cp {} /data/mirror/tmp/ \;
find timescaledb -name timescaledb-2-loader-postgresql-12_2.11.2*.deb  -exec cp {} /data/mirror/tmp/ \;


cp timescaledb/ubuntu/pool/focal/main/t/timescaledb-2-postgresql-13,timescaledb-2-postgresql-12} /data/apt/ts
cp timescaledb/ubuntu/pool/noble/main/t/timescaledb-2-postgresql-13}
cp timescaledb/debian/pool/bookworm/main/t/{timescaledb-2-postgresql-17,timescaledb-2-postgresql-16,timescaledb-2-postgresql-15,timescaledb-2-postgresql-14,timescaledb-2-postgresql-13,timescaledb-2-postgresql-12} /data/apt/ts
cp timescaledb/debian/pool/bullseye/main/t/{timescaledb-2-postgresql-17,timescaledb-2-postgresql-16,timescaledb-2-postgresql-15,timescaledb-2-postgresql-14,timescaledb-2-postgresql-13,timescaledb-2-postgresql-12} /data/apt/ts


rm -rf /data/apt/tmp/*dbgsym*

find tmp/ -name *debian11*.deb -exec cp {}    ~/pgsty/apt/extra/bullseye/ \;
find tmp/ -name *debian12*.deb -exec cp {}    ~/pgsty/apt/extra/bookworm/ \;
find tmp/ -name *ubuntu20.04*.deb -exec cp {} ~/pgsty/apt/extra/focal/ \;
find tmp/ -name *ubuntu22.04*.deb -exec cp {} ~/pgsty/apt/extra/jammy/ \;
find tmp/ -name *ubuntu24.04*.deb -exec cp {} ~/pgsty/apt/extra/noble/ \;

# find and copy haproxy

mkdir /data/apt/haproxy
find haproxy -name haproxy_3.1.0*bpo12*.deb -exec cp {} /data/apt/haproxy/ \;
find haproxy -name haproxy_3.1.0*bpo11*.deb -exec cp {} /data/apt/haproxy/ \;
find haproxy -name haproxy_3.0.6*noble*.deb    -exec cp {} /data/apt/haproxy/ \;
find haproxy -name haproxy_3.0.6*focal*.deb    -exec cp {} /data/apt/haproxy/ \;
find haproxy -name haproxy_3.0.6*jammy*.deb    -exec cp {} /data/apt/haproxy/ \;
```


cp *debian11*.deb     ~/pgsty/pkg/apt/pgsql/bullseye/stash
cp *debian12*.deb     ~/pgsty/pkg/apt/pgsql/bookworm/stash
cp *ubuntu20.04*.deb  ~/pgsty/pkg/apt/pgsql/focal/stash
cp *ubuntu22.04*.deb  ~/pgsty/pkg/apt/pgsql/jammy/stash
cp *ubuntu24.04*.deb  ~/pgsty/pkg/apt/pgsql/noble/stash