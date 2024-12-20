# Pigsty Package Repo

The supplementary [apt](apt/) and [yum](yum/) software repo for PostgreSQL ecosystem used by [Pigsty](https://pigsty.io)

Contains 150+ PG extensions for PostgreSQL 12 - 17 in addition to the official PGDG apt/yum repo.

Related Projects:

- [`infra_pkg`](https://github.com/pgsty/infra-pkg): Building observability stack & modules from tarball
- [`rpm`](https://github.com/pgsty/rpm): Building PostgreSQL RPM packages from source code
- [`deb`](https://github.com/pgsty/deb): Building PostgreSQL DEB packages from source code

The complete 340 [Extension List](https://ext.pigsty.io/list)


--------

## Pigsty

You can install pigsty source from this repo, via:

```bash
# install the latest pigsty version
curl -fsSL https://repo.pigsty.io/get | bash

# install a specific version
curl -fsSL https://repo.pigsty.io/get | bash -s v3.0.3
```


--------

## YUM Repo

Pigsty currently offers a supplementary PG extension repository for EL systems, providing **121** additional RPM plugins in addition to the official PGDG YUM repository (135).

- Pigsty YUM Repository: https://repo.pigsty.io/yum/
- PGDG YUM Repository: https://download.postgresql.org/pub/repos/yum/

The Pigsty YUM repository only includes extensions **not present in the PGDG YUM repository**.
Once an extension is added to the PGDG YUM repository, Pigsty YUM repository will either remove it or align with the PGDG repository.

For EL 7/8/9 and compatible systems, use the following commands to add the GPG public key and the upstream repository file of the Pigsty repository:

```bash
curl -fsSL https://repo.pigsty.io/key      | sudo tee /etc/pki/rpm-gpg/RPM-GPG-KEY-pigsty >/dev/null  # add gpg key
curl -fsSL https://repo.pigsty.io/yum/repo | sudo tee /etc/yum.repos.d/pigsty.repo        >/dev/null  # add repo file
```

All RPMs are signed with the GPG key fingerprint `9592A7BC7A682E7333376E09E7935D8DB9BD8B20` (`B9BD8B20`).

<details><summary>Write Repo File Manually</summary><br>

```bash
sudo tee /etc/yum.repos.d/pigsty-io.repo > /dev/null <<-'EOF'
[pigsty-infra]
name=Pigsty Infra for $basearch
baseurl=https://repo.pigsty.io/yum/infra/$basearch
skip_if_unavailable = 1
enabled = 1
priority = 1
gpgcheck = 1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-pigsty
module_hotfixes=1

[pigsty-pgsql]
name=Pigsty PGSQL For el$releasever.$basearch
baseurl=https://repo.pigsty.io/yum/pgsql/el$releasever.$basearch
skip_if_unavailable = 1
enabled = 1
priority = 1
gpgcheck = 1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-pigsty
module_hotfixes=1
EOF
sudo yum makecache;
```

</details>




--------

## APT Repo

Pigsty currently offers a supplementary PG extension repository for Debian/Ubuntu systems, providing **133** additional DEB packages in addition to the official PGDG APT repository (109).

- Pigsty APT Repository: https://repo.pigsty.io/apt/
- PGDG APT Repository: http://apt.postgresql.org/pub/repos/apt/

The Pigsty APT repository only includes extensions **not present in the PGDG APT repository**.
Once an extension is added to the PGDG APT repository, Pigsty APT repository will either remove it or align with the PGDG repository.

For Debian/Ubuntu and compatible systems, use the following commands to sequentially add the GPG public key and the upstream repository file of the Pigsty repository:

```bash
# add GPG key to keyring
curl -fsSL https://repo.pigsty.io/key | sudo gpg --dearmor -o /etc/apt/keyrings/pigsty.gpg

# get debian codename, distro_codename=jammy, focal, bullseye, bookworm
distro_codename=$(lsb_release -cs)
sudo tee /etc/apt/sources.list.d/pigsty-io.list > /dev/null <<EOF
deb [signed-by=/etc/apt/keyrings/pigsty.gpg] https://repo.pigsty.io/apt/infra generic main 
deb [signed-by=/etc/apt/keyrings/pigsty.gpg] https://repo.pigsty.io/apt/pgsql/${distro_codename} ${distro_codename} main
EOF

# refresh APT repo cache
sudo apt update
```

All DEBs are signed with the GPG key fingerprint `9592A7BC7A682E7333376E09E7935D8DB9BD8B20` (`B9BD8B20`).






--------

## What's inside?

Prepacked RPM & DEB binary packages for the following software.


**Observability Stack**:

- [grafana](https://github.com/grafana/grafana/) : 11.4.0
- [loki](https://github.com/grafana/loki) : 3.1.1
- [promtail](https://github.com/grafana/loki) : 3.0.0 (buggy 3.1.0)
- [prometheus](https://github.com/prometheus/prometheus) : 3.0.1
- [pushgateway](https://github.com/prometheus/pushgateway) : 1.9.0
- [alertmanager](https://github.com/prometheus/alertmanager) : 0.27.0
- [blackbox_exporter](https://github.com/prometheus/blackbox_exporter) : 0.25.0
- [nginx_exporter](https://github.com/nginxinc/nginx-prometheus-exporter) : 1.2.0
- [node_exporter](https://github.com/prometheus/node_exporter) : 1.8.2
- [keepalived_exporter](https://github.com/gen2brain/keepalived_exporter) : 0.7.0
- [**pg_exporter**](https://github.com/Vonng/pg_exporter) : 0.7.0
- [pgbackrest_exporter](https://github.com/woblerr/pgbackrest_exporter) 0.18.0
- [mysqld_exporter](https://github.com/prometheus/mysqld_exporter) : 0.15.1
- [redis_exporter](https://github.com/oliver006/redis_exporter) : v1.62.0
- [kafka_exporter](https://github.com/danielqsj/kafka_exporter) : 1.8.0
- [mongodb_exporter](https://github.com/percona/mongodb_exporter) : 0.40.0
- [VictoriaMetrics](https://github.com/VictoriaMetrics/VictoriaMetrics) : 1.102.1
- [VictoriaLogs](https://github.com/VictoriaMetrics/VictoriaMetrics/releases) : v0.28.0
- [vector](https://github.com/vectordotdev/vector/releases) : 0.40.0

**Database Modules**:

- [duckdb](https://github.com/duckdb/duckdb) : 1.1.3
- [etcd](https://github.com/etcd-io/etcd) : 3.5.17
- [redis](https://github.com/redis/redis) 7.2.6
- [minio](https://github.com/minio/minio): 20240817012454
- [mcli](https://github.com/minio/mc): 20240817113350
- [sealos](https://github.com/labring/sealos): 5.0.1
- [ferretdb](https://github.com/FerretDB/FerretDB): 1.24.0
- [paradedb](https://github.com/paradedb/paradedb): pg_search 0.13.1, pg_analytics 0.2.3
- [tigerbeetle](https://github.com/tigerbeetle/tigerbeetle): 0.16.13
- [cloudberrydb](https://github.com/cloudberrydb/cloudberrydb): 1.6.0

**PostgreSQL Tools**:

- [vip-manager](https://github.com/cybertec-postgresql/vip-manager): 2.6.0
- [pg_timetable](https://github.com/cybertec-postgresql/pg_timetable): 5.9.0
- [scws](https://github.com/hightman/scws): 1.2.3, deps of `zhparser`
- [libduckdb](https://github.com/duckdb/duckdb) : 1.1.2, deps of `duckdb_fdw`
- [promscale](https://github.com/timescale/promscale) 0.17.0

**PostgreSQL Extensions**:

- All Other PostgreSQL 16 Extensions for el8, el9, debian12, and ubuntu22.

--------

## Supported Distros

Observability Stack (the `infra` module) runs on any Linux distro.

While others (the `pgsql` module) are supported on the following distros:

- `el9.x86_64`: ⭐️ RockyLinux 9.3, and other compatible distros
- `d12.x86_64`: ⭐️ Debian 12 bookworm, and other compatible distros
- `u22.x86_64`: ⭐️ Ubuntu 22.04.3 jammy, and other compatible distros
- `u24.x86_64`: ⭐️ Ubuntu 24.04.3 noble, and other compatible distros
- `el8.x86_64`: ⭐️ RockyLinux 8.9, and other compatible distros

We may drop legacy support for the following distros in the future due to EOL:

- `el7.x86_64`: CentOS 7.9, and other compatible distros
- `d11.x86_64`: Debian 11 bullseye, and other compatible distros
- `u20.x86_64`: Ubuntu 20.04 focal, and other compatible distros


--------

## License

Maintainer: Ruohang Feng / [@Vonng](https://vonng.com/en/) ([rh@vonng.com](mailto:rh@vonng.com))

License: [Apache 2.0](LICENSE)
