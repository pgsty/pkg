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
```

Collect the latest haproxy deb

```bash
cp haproxy/debian/pool/main/h/haproxy/haproxy_3.0.5-1~bpo11+1_amd64.deb   pgsql/bullseye/stash
cp haproxy/debian/pool/main/h/haproxy/haproxy_3.0.3-1~bpo11+1_arm64.deb   pgsql/bullseye/stash
cp haproxy/debian/pool/main/h/haproxy/haproxy_3.0.5-1~bpo12+1_amd64.deb   pgsql/bookworm/stash
cp haproxy/debian/pool/main/h/haproxy/haproxy_3.0.3-1~bpo12+1_arm64.deb   pgsql/bookworm/stash
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.0.5-1ppa1~jammy_amd64.deb pgsql/jammy/stash
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.0.5-1ppa1~jammy_arm64.deb pgsql/jammy/stash
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.0.5-1ppa1~noble_amd64.deb pgsql/noble/stash
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.0.5-1ppa1~noble_arm64.deb pgsql/noble/stash
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.0.5-1ppa2~focal_amd64.deb pgsql/focal/stash
cp haproxy/ubuntu/pool/main/h/haproxy/haproxy_3.0.5-1ppa2~focal_arm64.deb pgsql/focal/stash
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
cp redis/deb/pool/jammy/r/re/redis*7.2.6*    pgsql/jammy/stash/
cp redis/deb/pool/noble/r/re/redis*7.2.6*    pgsql/noble/stash/
cp redis/deb/pool/focal/r/re/redis*7.2.6*    pgsql/focal/stash/
cp redis/deb/pool/bookworm/r/re/redis*7.2.6* pgsql/bookworm/stash/
cp redis/deb/pool/bullseye/r/re/redis*7.2.6* pgsql/bullseye/stash/
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


cp citus/debian/pool/bookworm/main/p/citus/postgresql-*-citus-12.1_12.1.5*.deb                             pgsql/bookworm/stash/
cp citus/debian/pool/bullseye/main/p/citus/postgresql-*-citus-12.1_12.1.5*.deb                             pgsql/bullseye/stash/
cp citus/ubuntu/pool/jammy/main/p/citus/postgresql-*-citus-12.1_12.1.5*.deb                                pgsql/jammy/stash/
cp citus/ubuntu/pool/focal/main/p/citus/postgresql-*-citus-12.1_12.1.5*.deb                                pgsql/focal/stash/
#cp citus/ubuntu/pool/focal/main/p/citus/postgresql-*-citus-12.1_12.1.5*.deb     pgsql/noble/stash/ # not supported yet
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
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/jammy/main/t/{timescaledb-2-2.17.1-postgresql-17,timescaledb-2-2.17.1-postgresql-16,timescaledb-2-2.17.1-postgresql-15,timescaledb-2-2.17.1-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/focal/main/t/{timescaledb-2-2.17.1-postgresql-17,timescaledb-2-2.17.1-postgresql-16,timescaledb-2-2.17.1-postgresql-15,timescaledb-2-2.17.1-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/noble/main/t/{timescaledb-2-2.17.1-postgresql-17,timescaledb-2-2.17.1-postgresql-16,timescaledb-2-2.17.1-postgresql-15,timescaledb-2-2.17.1-postgresql-14,timescaledb-2-2.15.3-postgresql-13}
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bookworm/main/t/{timescaledb-2-2.17.1-postgresql-17,timescaledb-2-2.17.1-postgresql-16,timescaledb-2-2.17.1-postgresql-15,timescaledb-2-2.17.1-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}
ls -alh /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bullseye/main/t/{timescaledb-2-2.17.1-postgresql-17,timescaledb-2-2.17.1-postgresql-16,timescaledb-2-2.17.1-postgresql-15,timescaledb-2-2.17.1-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}

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
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/jammy/main/t/{timescaledb-2-2.17.1-postgresql-17,timescaledb-2-2.17.1-postgresql-16,timescaledb-2-2.17.1-postgresql-15,timescaledb-2-2.17.1-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}/*      jammy/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/focal/main/t/{timescaledb-2-2.17.1-postgresql-17,timescaledb-2-2.17.1-postgresql-16,timescaledb-2-2.17.1-postgresql-15,timescaledb-2-2.17.1-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}/*      focal/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/ubuntu/pool/noble/main/t/{timescaledb-2-2.17.1-postgresql-17,timescaledb-2-2.17.1-postgresql-16,timescaledb-2-2.17.1-postgresql-15,timescaledb-2-2.17.1-postgresql-14,timescaledb-2-2.15.3-postgresql-13}/*                                         noble/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bookworm/main/t/{timescaledb-2-2.17.1-postgresql-17,timescaledb-2-2.17.1-postgresql-16,timescaledb-2-2.17.1-postgresql-15,timescaledb-2-2.17.1-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}/*   bookworm/
cp /var/spool/apt-mirror/mirror/packagecloud.io/timescale/timescaledb/debian/pool/bullseye/main/t/{timescaledb-2-2.17.1-postgresql-17,timescaledb-2-2.17.1-postgresql-16,timescaledb-2-2.17.1-postgresql-15,timescaledb-2-2.17.1-postgresql-14,timescaledb-2-2.15.3-postgresql-13,timescaledb-2-2.11.2-postgresql-12}/*   bullseye/

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