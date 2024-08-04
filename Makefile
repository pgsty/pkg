#==============================================================#
# File      :   Makefile
# Desc      :   pgsty/pkg repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-07-28
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
#                 Publishing to Cloudflare                    #
###############################################################
cf-yum:
	cd yum && make upload
cf-apt:
	cd apt && make upload
cf-key:
	rclone copyto key $(CF_PATH)/key
cf-etc:
	rclone sync -P --transfers=8 ./etc/ $(CF_PATH)/etc/
cf-src:
	rclone sync -P --transfers=8 ./src/ $(CF_PATH)/src/

###############################################################
#                     Publishing to COS                       #
###############################################################
cos-key:
	rclone copyto key $(COS_PATH)/key
cos-etc:
	rclone sync -P --transfers=8 ./etc/ $(COS_PATH)/etc/
cos-src:
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
.PHONY: all cf-yum cf-apt cf-key push pushd pull pulld