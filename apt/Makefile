#==============================================================#
# File      :   Makefile
# Desc      :   apt repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-07-28
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   AGPLv3
#==============================================================#

CF_PATH = cf:/repo/apt
COS_PATH = cos://repo-1304744452/yum
DEVEL_PATH = sv:/data/pkg/apt

###############################################################
#                       1. Maintenance                        #
###############################################################
init:
	mkdir -p infra infra/{conf,db,dists,pool}
	mkdir -p pgsql pgsql/{conf,db,dists,pool}
	mkdir -p pgsty pgsty/{conf,db,dists,pool}

clean:
	rm -rf stash/*

add-infra:
	reprepro -b infra includedeb generic stash/*.deb
ls-infra:
	reprepro -b infra list generic

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
# reprepro -b infra remove generic ferretdb

pgsql-include:
	reprepro -b pgsql includedeb bookworm stash/bookworm.amd64/postgresql-16*.deb
	reprepro -b pgsql includedeb jammy    stash/jammy.amd64/postgresql-16*.deb
pgsty-add-jammy:
	reprepro -b pgsty includedeb jammy stash/jammy.amd64/*.deb
pgsty-add-bookworm:
	reprepro -b pgsty includedeb bookworm stash/bookworm.amd64/*.deb
pgsty-ls-jammy:
	reprepro -b pgsty list jammy
pgsty-ls-bookworm:
	reprepro -b pgsty list bookworm


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
	rclone sync -P --transfers=8 ./infra/ $(CF_PATH)/infra/
publish-pgsql:
	rclone sync -P --transfers=8 ./pgsql/ $(CF_PATH)/pgsql/

upload-cdn: publish-pgsql-cdn publish-infra-cdn
publish-infra-cdn:
	coscmd -b repo-1304744452 upload --recursive -s -f -y --delete infra apt/infra
publish-pgsql-cdn:
	coscmd -b repo-1304744452 upload --recursive -s -f -y --delete pgsql apt/pgsql

###############################################################
#                         Inventory                           #
###############################################################
.PHONY: init add-infra add-focal add-jammy add-noble add-bookworm add-bullseye \
	push pushd pull pulld