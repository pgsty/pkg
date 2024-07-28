#==============================================================#
# File      :   Makefile
# Desc      :   apt repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-07-28
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   AGPLv3
#==============================================================#

CLOUD_PATH = cf:/pkg/apt
DEVEL_PATH = sv:/data/pkg/apt

###############################################################
#                       1. Maintenance                        #
###############################################################
init:
	mkdir -p infra infra/{conf,db,dists,pool}
	mkdir -p pgsql pgsql/{conf,db,dists,pool}

clean:
	rm -rf stash/*

add-infra:
	reprepro -b infra includedeb generic stash/*.deb
add-focal:
	reprepro -b pgsql includedeb focal stash/*.deb
add-jammy:
	reprepro -b pgsql includedeb jammy stash/*.deb
add-noble:
	reprepro -b pgsql includedeb noble stash/*.deb
add-bookworm:
	reprepro -b pgsql includedeb bookworm stash/*.deb
add-bullseye:
	reprepro -b pgsql includedeb bullseye stash/*.deb

ls-infra:
	reprepro -b infra list generic
ls-focal:
	reprepro -b pgsql list focal
ls-jammy:
	reprepro -b pgsql list jammy
ls-noble:
	reprepro -b pgsql list noble
ls-bookworm:
	reprepro -b pgsql list bookworm
ls-bullseye:
	reprepro -b pgsql list bullseye

# how to remove (e.g.)
# reprepro -b pgsql remove bookworm haproxy

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

###############################################################
#                         Inventory                           #
###############################################################
.PHONY: init add-infra add-focal add-jammy add-noble add-bookworm add-bullseye \
	push pushd pull pulld