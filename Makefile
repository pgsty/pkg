#==============================================================#
# File      :   Makefile
# Desc      :   pgsty/pkg repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-07-28
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   AGPLv3
#==============================================================#

CLOUD_PATH = cf:/repo
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
	rclone copy key cf:/pkg/
cf-etc:
	rclone sync -P --transfers=8 ./etc/ $(CLOUD_PATH)/etc/


###############################################################
#                     Publishing to COS                       #
###############################################################
cos-key:
	coscmd -b repo-1304744452 upload -s -f -y --delete key key
cos-etc:
	coscmd -b repo-1304744452 upload --recursive -s -f -y --delete etc etc
cos-src:
	coscmd -b repo-1304744452 upload --recursive -s -f -y --delete src src


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