#==============================================================#
# File      :   Makefile
# Desc      :   pgsty/pkg repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-12-16
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   AGPLv3
#==============================================================#

CF_PATH = cf:/repo
COS_PATH = cos://repo-1304744452
DEVEL_PATH = sv:/data/pkg
VERSION=v3.2.1

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
	@echo "https://repo.pigsty.cc/get" @ "https://console.cloud.tencent.com/cdn/refresh?tab=url"
	@echo "https://repo.pigsty.io/get" @ "https://dash.cloudflare.com/72cdbd1b54f7add44ecbd3d986399481/pigsty.io/caching/configuration"

upg: upload-pig-get
upload-pig-get:
	rclone copyto pig.io $(CF_PATH)/pig
	rclone copyto pig.cc $(COS_PATH)/pig
	@echo "https://repo.pigsty.cc/pig" @ "https://console.cloud.tencent.com/cdn/refresh?tab=url"
	@echo "https://repo.pigsty.io/pig" @ "https://dash.cloudflare.com/72cdbd1b54f7add44ecbd3d986399481/pigsty.io/caching/configuration"

ur:
	rclone copyto ray $(CF_PATH)/ray
	rclone copyto ray $(COS_PATH)/ray
	rclone copyto rays $(CF_PATH)/rays
	rclone copyto rays $(COS_PATH)/rays
	rclone copyto build $(CF_PATH)/build
	rclone copyto build $(COS_PATH)/build


up: upload-pkg
upload-pkg:
	rclone sync -P --transfers=8 ./pkg/ $(CF_PATH)/pkg/
	rclone sync -P --transfers=8 ./pkg/ $(COS_PATH)/pkg/

ue: upload-etc
upload-etc:
	rclone sync -P --transfers=8 ./etc/ $(CF_PATH)/etc/
	rclone sync -P --transfers=8 ./etc/ $(COS_PATH)/etc/

ux: upload-ext
upload-ext:
	#rclone sync -P --transfers=8 ./ext/ $(CF_PATH)/ext/
	rclone sync -P --transfers=8 ./ext/ $(COS_PATH)/ext/

us: upload-src
upload-src:
	cd src && md5sum *.tgz > checksums
	rclone sync -P --transfers=8 ./src/ $(CF_PATH)/src/
	rclone sync -P --transfers=8 ./src/ $(COS_PATH)/src/
	@echo "https://repo.pigsty.cc/src/pigsty-$(VERSION).tgz" @ "https://console.cloud.tencent.com/cdn/refresh?tab=url"
	@echo "https://repo.pigsty.io/src/pigsty-$(VERSION).tgz" @ "https://dash.cloudflare.com/72cdbd1b54f7add44ecbd3d986399481/pigsty.io/caching/configuration"


ul: upload-latest
upload-latest:
	rclone copyto ./src/pigsty-$(VERSION).tgz $(CF_PATH)/src/pigsty-$(VERSION).tgz
	rclone copyto ./src/pigsty-$(VERSION).tgz $(COS_PATH)/src/pigsty-$(VERSION).tgz
	@echo "https://repo.pigsty.cc/src/pigsty-$(VERSION).tgz" @ "https://console.cloud.tencent.com/cdn/refresh?tab=url"
	@echo "https://repo.pigsty.io/src/pigsty-$(VERSION).tgz" @ "https://dash.cloudflare.com/72cdbd1b54f7add44ecbd3d986399481/pigsty.io/caching/configuration"


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
pl: pull-src
pull-src:
	rsync -avz  sv:/data/pigsty/dist/${VERSION}/pigsty-${VERSION}.tgz src/pigsty-${VERSION}.tgz

###############################################################
#                         Inventory                           #
###############################################################
.PHONY: all uy ua uk ug up upg ue us ul push pushd pull pulld pl pull-src \
	upload-yum upload-apt upload-key upload-get upload-etc upload-src upload-latest upload-pkg upload-pig-get