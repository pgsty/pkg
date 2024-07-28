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
	@echo "pgsty package repo"
cf-yum:
	rclone sync -P --transfers=8  repo/rpm/ cf:/repo/yum/
cf-apt:
	rclone sync -P --transfers=8  repo/deb/ cf:/repo/apt/
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
.PHONY: all cf-yum cf-apt push pushd pull pulld