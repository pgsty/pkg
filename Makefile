#==============================================================#
# File      :   Makefile
# Desc      :   pgsty/pkg repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-07-28
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   AGPLv3
#==============================================================#

CLOUD_PATH = cf:/pkg
DEVEL_PATH = sv:/data/pkg

###############################################################
#                       1. Publishing                         #
###############################################################
all:
	@echo "pgsty repo"
cf-yum:
	cd yum && make upload
cf-apt:
	cd apt && make upload
cf-key:
	rclone copy key cf:/pkg/


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