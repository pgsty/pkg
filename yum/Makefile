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
#                       1. Publishing                         #
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
	./build	infra/x86_64     sign
	./build	infra/aarch64    sign
	./build	pgsql/el7.x86_64 sign
	./build	pgsql/el8.x86_64 sign
	./build	pgsql/el9.x86_64 sign

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
#                         Inventory                           #
###############################################################
.PHONY: init build builds push pushd pull pulld