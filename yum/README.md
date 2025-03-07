# PGSTY YUM Repository

This repo contains supplementary packages for the official [PGDG YUM](https://download.postgresql.org/pub/repos/yum/) repo.


--------

## Content (x86_64)

### el7

- redis 7.2.5
- **haproxy** 2.9.9
- **keepalived** 1.3.5
- **flamegraph** 1.0
- scws 1.2.3
- PostgreSQL 15 Extra Extensions

### el8

- redis 7.2.5
- pg_search 0.8.6
- pg_lakehouse 0.8.6
- libarrow-s3 17.0.0
- libduckdb 1.0.0
- scws 1.2.3
- PostgreSQL 16 Extra Extensions

### el9

- redis 7.2.5
- scws 1.2.3
- pg_search 0.8.6
- pg_lakehouse 0.8.6
- libarrow-s3 17.0.0
- libduckdb 1.0.0
- **pgxnclient** 1.3.2 (MISSING in PGDG)
- PostgreSQL 16 Extra Extensions


## TimescaleDB

```bash
mkdir -p /data/yum/{el8,el9}

find t8 -name timescaledb-tools*0.18.0*               -exec cp {} /data/yum/el8 \;
find t9 -name timescaledb-tools*0.18.0*               -exec cp {} /data/yum/el9 \;

# timescaletoolkit no el8 support
find t9 -name timescaledb-toolkit*1.19.0*.rpm         -exec cp {} /data/yum/el9 \;
find t9 -name timescaledb-toolkit*1.19.0*.rpm         -exec cp {} /data/yum/el9 \;


find t8 -name timescaledb-2-postgresql-*2.17.2*.rpm   -exec cp {} /data/yum/el8/ \;
find t8 -name timescaledb-2-postgresql-13*2.15.3*.rpm -exec cp {} /data/yum/el8/ \;
find t8 -name timescaledb-2-postgresql-12*2.11.2*.rpm -exec cp {} /data/yum/el8/ \;
find t8 -name timescaledb-2-loader-postgresql-*2.17.2*.rpm   -exec cp {} /data/yum/el8/ \;
find t8 -name timescaledb-2-loader-postgresql-13*2.15.3*.rpm -exec cp {} /data/yum/el8/ \;
find t8 -name timescaledb-2-loader-postgresql-12*2.11.2*.rpm -exec cp {} /data/yum/el8/ \;



find t9 -name timescaledb-2-postgresql-*2.17.2*.rpm   -exec cp {} /data/yum/el9/ \;
find t9 -name timescaledb-2-postgresql-13*2.15.3*.rpm -exec cp {} /data/yum/el9/ \;
find t9 -name timescaledb-2-postgresql-12*2.11.2*.rpm -exec cp {} /data/yum/el9/ \;
find t9 -name timescaledb-2-loader-postgresql-*2.17.2*.rpm   -exec cp {} /data/yum/el9/ \;
find t9 -name timescaledb-2-loader-postgresql-13*2.15.3*.rpm -exec cp {} /data/yum/el9/ \;
find t9 -name timescaledb-2-loader-postgresql-12*2.11.2*.rpm -exec cp {} /data/yum/el9/ \;
```