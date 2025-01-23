#==============================================================#
# File      :   Makefile
# Desc      :   yum repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-10-15
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   AGPLv3
#==============================================================#

CF_PATH = cf:/repo/yum
COS_PATH = cos://repo-1304744452/yum
DEVEL_PATH = sv:/data/pkg/yum

###############################################################
#                      1. Maintenance                         #
###############################################################
init:
	mkdir -p infra infra/x86_64 infra/aarch64
	mkdir -p pgsql pgsql/el7.x86_64 pgsql/el8.x86_64 pgsql/el9.x86_64
	mkdir -p polar polar/el7.x86_64
	mkdir -p ivory ivory/el7.x86_64 ivory/el8.x86_64 ivory/el9.x86_64
	mkdir -p mssql mssql/el7.x86_64 mssql/el8.x86_64 mssql/el9.x86_64

build:
	./build	infra/x86_64
	./build	infra/aarch64
	./build	pgsql/el7.x86_64
	./build	pgsql/el8.x86_64
	./build	pgsql/el9.x86_64
	./build	pgsql/el8.aarch64
	./build	pgsql/el9.aarch64
	./build	polar/el7.x86_64
	./build	mssql/el7.x86_64
	./build	mssql/el8.x86_64
	./build	mssql/el9.x86_64
	./build	ivory/el7.x86_64
	./build	ivory/el8.x86_64
	./build	ivory/el9.x86_64
	./build	gpsql/el7.x86_64
	./build	gpsql/el8.x86_64
	./build	gpsql/el9.x86_64

builds:
	./build	infra/x86_64       sign
	./build	infra/aarch64      sign
	./build	pgsql/el7.x86_64   sign
	./build	pgsql/el8.x86_64   sign
	./build	pgsql/el9.x86_64   sign
	./build	pgsql/el8.aarch64  sign
	./build	pgsql/el9.aarch64  sign
	./build	polar/el7.x86_64   sign
	./build	mssql/el7.x86_64   sign
	./build	mssql/el8.x86_64   sign
	./build	mssql/el9.x86_64   sign
	./build	ivory/el7.x86_64   sign
	./build	ivory/el8.x86_64   sign
	./build	ivory/el9.x86_64   sign
	./build	gpsql/el7.x86_64   sign
	./build	gpsql/el8.x86_64   sign
	./build	gpsql/el9.x86_64   sign


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
upload: cf-upload cos-upload
cf-upload: cf-infra cf-pgsql
upload-infra: cf-infra cos-infra
upload-pgsql: cf-pgsql cos-pgsql

cf-infra:
	rclone sync -P --transfers=8 ./infra/ $(CF_PATH)/infra/
cf-pgsql:
	rclone sync -P --transfers=8 ./pgsql/ $(CF_PATH)/pgsql/
cf-pgsql8:
	rclone sync -P --transfers=8 ./pgsql/el8.x86_64/  $(CF_PATH)/pgsql/el8.x86_64/
cf-pgsql8a:
	rclone sync -P --transfers=8 ./pgsql/el8.aarch64/ $(CF_PATH)/pgsql/el8.aarch64/
cf-pgsql9:
	rclone sync -P --transfers=8 ./pgsql/el9.x86_64/  $(CF_PATH)/pgsql/el9.x86_64/
cf-pgsql9a:
	rclone sync -P --transfers=8 ./pgsql/el9.aarch64/ $(CF_PATH)/pgsql/el9.aarch64/
cf-ivory:
	rclone sync -P --transfers=8 ./ivory/ $(CF_PATH)/ivory/
cf-gpsql:
	rclone sync -P --transfers=8 ./gpsql/ $(CF_PATH)/gpsql/
cf-mssql:
	rclone sync -P --transfers=8 ./mssql/ $(CF_PATH)/mssql/

cos-upload: cos-infra cos-pgsql
cos-infra:
	rclone sync -P --transfers=8 ./infra/ $(COS_PATH)/infra/
cos-pgsql:
	rclone sync -P --transfers=8 ./pgsql/ $(COS_PATH)/pgsql/
cos-pgsql8:
	rclone sync -P --transfers=8 ./pgsql/el8.x86_64/  $(COS_PATH)/pgsql/el8.x86_64/
cos-pgsql8a:
	rclone sync -P --transfers=8 ./pgsql/el8.aarch64/ $(COS_PATH)/pgsql/el8.aarch64/
cos-pgsql9:
	rclone sync -P --transfers=8 ./pgsql/el9.x86_64/  $(COS_PATH)/pgsql/el9.x86_64/
cos-pgsql9a:
	rclone sync -P --transfers=8 ./pgsql/el9.aarch64/ $(COS_PATH)/pgsql/el9.aarch64/

cos-ivory:
	rclone sync -P --transfers=8 ./ivory/ $(COS_PATH)/ivory/
cos-gpsql:
	rclone sync -P --transfers=8 ./gpsql/ $(COS_PATH)/gpsql/
cos-mssql:
	rclone sync -P --transfers=8 ./mssql/ $(COS_PATH)/mssql/

upload-repo:
	rclone copyto repo.io $(CF_PATH)/repo
	rclone copyto repo.cc $(COS_PATH)/repo

###############################################################
#                         Inventory                           #
###############################################################
.PHONY: init build builds push pushd pull pulld \
	upload cf-upload cos-upload upload-repo \
    cf-infra cf-pgsql cf-ivory cf-gpsql cf-mssql \
    cos-infra cos-pgsql cos-ivory cos-gpsql cos-mssql \
    rb rbs bb bbs