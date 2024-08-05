#==============================================================#
# File      :   Makefile
# Desc      :   pgsty/pkg repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-08-05
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   AGPLv3
#==============================================================#

CF_PATH = cf:/repo
COS_PATH = cos://repo-1304744452
DEVEL_PATH = sv:/data/pkg

all:
	@echo "pgsty repo"

###############################################################
#                         Publishing                          #
###############################################################
uy: upload-yum
upload-yum:
	cd yum && make upload
ua: upload-apt
upload-apt:
	cd apt && make upload
uk: upload-key
upload-key:
	rclone copyto key $(CF_PATH)/key
	rclone copyto key $(COS_PATH)/key
ug: upload-get
upload-get:
	rclone copyto get.io $(CF_PATH)/get
	rclone copyto get.cc $(COS_PATH)/get
ue: upload-etc
upload-etc:
	rclone sync -P --transfers=8 ./etc/ $(CF_PATH)/etc/
	rclone sync -P --transfers=8 ./etc/ $(COS_PATH)/etc/
us: upload-src
upload-src:
	rclone sync -P --transfers=8 ./src/ $(CF_PATH)/src/
	rclone sync -P --transfers=8 ./src/ $(COS_PATH)/src/

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
.PHONY: all uy ua uk ug ue us push pushd pull pulld \
	upload-yum upload-apt upload-key upload-get upload-etc upload-src