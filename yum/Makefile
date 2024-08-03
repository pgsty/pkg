#==============================================================#
# File      :   Makefile
# Desc      :   yum repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-07-28
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   AGPLv3
#==============================================================#

CLOUD_PATH = cf:/repo/yum
DEVEL_PATH = sv:/data/pkg/yum

###############################################################
#                      1. Maintenance                         #
###############################################################
init:
	mkdir -p infra infra/x86_64 infra/aarch64
	mkdir -p pgsql pgsql/el7.x86_64 pgsql/el8.x86_64 pgsql/el9.x86_64

build:
	./build	infra/x86_64
	./build	infra/aarch64
	./build	pgsql/el7.x86_64
	./build	pgsql/el8.x86_64
	./build	pgsql/el9.x86_64
	./build	pgsty/el7.x86_64
	./build	pgsty/el8.x86_64
	./build	pgsty/el9.x86_64
builds:
	./build	infra/x86_64      sign
	./build	infra/aarch64     sign
	./build	pgsql/el7.x86_64  sign
	./build	pgsql/el8.x86_64  sign
	./build	pgsql/el9.x86_64  sign
	./build	pgsty/el7.x86_64  sign
	./build	pgsty/el8.x86_64  sign
	./build	pgsty/el9.x86_64  sign

adjust:
	mv -f pgsty/el7.x86_64/scws*.rpm         pgsql/el7.x86_64/ || true
	mv -f pgsty/el7.x86_64/pg_filedump*.rpm  pgsql/el7.x86_64/ || true
	mv -f pgsty/el8.x86_64/scws*.rpm         pgsql/el8.x86_64/ || true
	mv -f pgsty/el8.x86_64/libduckdb*.rpm    pgsql/el8.x86_64/ || true
	mv -f pgsty/el8.x86_64/pg_filedump*.rpm  pgsql/el8.x86_64/ || true
	mv -f pgsty/el8.x86_64/pg_search*.rpm    pgsql/el8.x86_64/ || true
	mv -f pgsty/el8.x86_64/pg_lakehouse*.rpm pgsql/el8.x86_64/ || true
	mv -f pgsty/el9.x86_64/scws*.rpm         pgsql/el9.x86_64/ || true
	mv -f pgsty/el9.x86_64/libduckdb*.rpm    pgsql/el9.x86_64/ || true
	mv -f pgsty/el9.x86_64/pg_filedump*.rpm  pgsql/el9.x86_64/ || true
	mv -f pgsty/el9.x86_64/pg_search*.rpm    pgsql/el9.x86_64/ || true
	mv -f pgsty/el9.x86_64/pg_lakehouse*.rpm pgsql/el9.x86_64/ || true
	cp -f pgsty/el7.x86_64/*_15-*.rpm pgsql/el7.x86_64/ || true
	cp -f pgsty/el8.x86_64/*_16-*.rpm pgsql/el8.x86_64/ || true
	cp -f pgsty/el9.x86_64/*_16-*.rpm pgsql/el9.x86_64/ || true

# building alias
bb: pushd rb pulld
bbs: pushd rbs pulld
rb:
	ssh sv 'cd /data/pkg/yum && make build'
rbs:
	ssh sv 'cd /data/pkg/yum && make builds'

###############################################################
#                        2. Syncing                           #
###############################################################
push:
	rsync -avc ./ $(DEVEL_PATH)/
pushd:
	rsync -avc --delete ./ $(DEVEL_PATH)/
pull:
	rsync -avc $(DEVEL_PATH)/ ./
pulld:
	rsync -avc --delete $(DEVEL_PATH)/ ./


###############################################################
#                       3. Publishing                         #
###############################################################
upload: publish-pgsql publish-infra
publish-infra:
	rclone sync -P --transfers=8 ./infra/ $(CLOUD_PATH)/infra/
publish-pgsql:
	rclone sync -P --transfers=8 ./pgsql/ $(CLOUD_PATH)/pgsql/
publish-pgsql-el7:
	rclone sync -P --transfers=8 ./pgsql/el7.x86_64/ $(CLOUD_PATH)/pgsql/el7.x86_64/
publish-pgsql-el8:
	rclone sync -P --transfers=8 ./pgsql/el8.x86_64/ $(CLOUD_PATH)/pgsql/el8.x86_64/
publish-pgsql-el9:
	rclone sync -P --transfers=8 ./pgsql/el9.x86_64/ $(CLOUD_PATH)/pgsql/el9.x86_64/

upload-cdn: publish-pgsql-cdn publish-infra-cdn
publish-infra-cdn:
	coscmd -b repo-1304744452 upload --recursive -s -f -y --delete infra yum/infra
publish-pgsql-cdn:
	coscmd -b repo-1304744452 upload --recursive -s -f -y --delete pgsql yum/pgsql

###############################################################
#                         Inventory                           #
###############################################################
.PHONY: init build builds push pushd pull pulld