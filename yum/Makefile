#==============================================================#
# File      :   Makefile
# Desc      :   yum repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-07-28
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   AGPLv3
#==============================================================#

CLOUD_PATH = cf:/pkg/yum
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

builds:
	./build	infra/x86_64      sign
	./build	infra/aarch64     sign
	./build	pgsql/el7.x86_64  sign
	./build	pgsql/el8.x86_64  sign
	./build	pgsql/el9.x86_64  sign


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


###############################################################
#                         Inventory                           #
###############################################################
.PHONY: init build builds push pushd pull pulld