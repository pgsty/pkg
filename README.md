# Pigsty Package Repo

The supplementary [apt](apt/) and [yum](yum/) software repo for PostgreSQL ecosystem used by [Pigsty](https://pigsty.io)

Contains 150+ PG extensions for PostgreSQL 12 - 17 in addition to the official PGDG apt/yum repo.

Related Projects:

- [`infra_pkg`](https://github.com/pgsty/infra-pkg): Building observability stack & modules from tarball
- [`rpm`](https://github.com/pgsty/rpm): Building PostgreSQL RPM packages from source code
- [`deb`](https://github.com/pgsty/deb): Building PostgreSQL DEB packages from source code

The complete 341 [Extension List](https://ext.pigsty.io/list)


--------

## Pigsty

You can install pigsty source from this repo, via:

```bash
# install the latest pigsty version
curl -fsSL https://repo.pigsty.io/get | bash

# install a specific version
curl -fsSL https://repo.pigsty.io/get | bash -s v3.2.0
```

You can install pigsty cli - `pig` with

```bash
curl -fsSL https://repo.pigsty.io/pig | bash
curl -fsSL https://repo.pigsty.cc/pig | bash  # mirror
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
sudo yum makecache
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
curl -fsSL https://repo.pigsty.io/key | sudo gpg --dearmor -o /etc/apt/keyrings/pigsty.gpg  # add gpg key
sudo tee /etc/apt/sources.list.d/pigsty-io.list > /dev/null <<EOF
deb [signed-by=/etc/apt/keyrings/pigsty.gpg] https://repo.pigsty.io/apt/infra generic main 
deb [signed-by=/etc/apt/keyrings/pigsty.gpg] https://repo.pigsty.io/apt/pgsql/$(lsb_release -cs) $(lsb_release -cs) main
EOF
sudo apt update
```

All DEBs are signed with the GPG key fingerprint `9592A7BC7A682E7333376E09E7935D8DB9BD8B20` (`B9BD8B20`).






--------

## What's inside?

Prepacked RPM & DEB binary packages for the following software.


**Observability Stack**:

- [prometheus](https://github.com/prometheus/prometheus) : 3.0.1
- [pushgateway](https://github.com/prometheus/pushgateway) : 1.10.0
- [alertmanager](https://github.com/prometheus/alertmanager) : 0.27.0
- [blackbox_exporter](https://github.com/prometheus/blackbox_exporter) : 0.25.0
- [nginx_exporter](https://github.com/nginxinc/nginx-prometheus-exporter) : 1.4.0
- [node_exporter](https://github.com/prometheus/node_exporter) : 1.8.2
- [keepalived_exporter](https://github.com/mehdy/keepalived-exporter) : 1.4.0
- [pgbackrest_exporter](https://github.com/woblerr/pgbackrest_exporter) 0.18.0
- [mysqld_exporter](https://github.com/prometheus/mysqld_exporter) : 0.16.0
- [redis_exporter](https://github.com/oliver006/redis_exporter) : v1.66.0
- [kafka_exporter](https://github.com/danielqsj/kafka_exporter) : 1.8.0
- [mongodb_exporter](https://github.com/percona/mongodb_exporter) : 0.43.0
- [VictoriaMetrics](https://github.com/VictoriaMetrics/VictoriaMetrics) : 1.107.0
- [VictoriaLogs](https://github.com/VictoriaMetrics/VictoriaMetrics/releases) : v1.3.2
- [pg_timetable](https://github.com/cybertec-postgresql/pg_timetable): 5.10.0
- [ferretdb](https://github.com/FerretDB/FerretDB): 1.24.0
- [tigerbeetle](https://github.com/tigerbeetle/tigerbeetle) 0.16.13
- [loki](https://github.com/grafana/loki) : 3.1.1
- [promtail](https://github.com/grafana/loki/releases/tag/v3.0.0) : 3.0.0 (3.1.1 fail on el7/el8)
- [vector](https://github.com/vectordotdev/vector/releases) : 0.43.1
- [**pg_exporter**](https://github.com/Vonng/pg_exporter) : 0.7.1 (Maintained Separately)

**Database Modules**:

- [duckdb](https://github.com/duckdb/duckdb) : 1.1.3
- [etcd](https://github.com/etcd-io/etcd) : 3.5.17
- [redis](https://github.com/redis/redis) 7.2.6
- [minio](https://github.com/minio/minio): 20241213221912
- [mcli](https://github.com/minio/mc): 20241121172154
- [sealos](https://github.com/labring/sealos): 5.0.1
- [ferretdb](https://github.com/FerretDB/FerretDB): 1.24.0
- [paradedb](https://github.com/paradedb/paradedb): pg_search 0.13.2, pg_analytics 0.2.4
- [tigerbeetle](https://github.com/tigerbeetle/tigerbeetle): 0.16.17
- [cloudberrydb](https://github.com/cloudberrydb/cloudberrydb): 1.6.0

**PostgreSQL Tools**:

- [vip-manager](https://github.com/cybertec-postgresql/vip-manager): 3.0.0
- [pg_timetable](https://github.com/cybertec-postgresql/pg_timetable): 5.10.0
- [scws](https://github.com/hightman/scws): 1.2.3, deps of `zhparser`
- [libduckdb](https://github.com/duckdb/duckdb) : 1.1.2, deps of `duckdb_fdw`
- [promscale](https://github.com/timescale/promscale) 0.17.0

**PostgreSQL Extensions**:

- PostgreSQL 12-17 Extensions for el8, el9, debian12, and ubuntu22. 
- check the [Extension List](https://ext.pigsty.io/#/list) for details.


--------

## Supported Distros

Observability Stack (the `infra` module) runs on any Linux distro.

While others (the `pgsql` module) are supported on the following distros:

|  Code   | Distro                            |   `amd64`    | Availability |   `arm64`   | Availability |
|:-------:|-----------------------------------|:------------:|:------------:|:-----------:|:------------:|
| **EL9** | RHEL 9 / Rocky9 / Alma9           | `el9.x86_64` |      ✔       | `el9.arm64` |      ✔       |
| **EL8** | RHEL 8 / Rocky8 / Alma8 / Anolis8 | `el8.x86_64` |      ✔       | `el8.arm64` |      ✔       |
| **U24** | Ubuntu 24.04 (noble)              | `u24.x86_64` |      ✔       | `u24.arm64` |      ✔       |
| **U22** | Ubuntu 22.04 (jammy)              | `u22.x86_64` |      ✔       | `u22.arm64` |      ✔       |
| **D12** | Debian 12 (bookworm)              | `d12.x86_64` |      ✔       | `d12.arm64` |      ✔       |
| **D11** | Debian 11 (bullseye)              | `d12.x86_64` |      ✓       | `d11.arm64` |      ✘       |
| **U20** | Ubuntu 20.04 (focal)              | `d12.x86_64` |      ✓       | `u20.arm64` |      ✘       |
| **EL7** | RHEL7 / CentOS7                   | `d12.x86_64` |      ✓       | `el7.arm64` |      ✘       |


--------

## License

Maintainer: Ruohang Feng / [@Vonng](https://vonng.com/en/) ([rh@vonng.com](mailto:rh@vonng.com))

License: [Apache 2.0](LICENSE)
