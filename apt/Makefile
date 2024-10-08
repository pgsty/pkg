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
COS_PATH = cos://repo-1304744452/apt
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
	reprepro -b infra includedeb generic infra/stash/*.deb
ls-infra:
	reprepro -b infra list generic

add-all: add-focal add-jammy add-noble add-bookworm add-bullseye
add-focal:
	reprepro -b pgsql/focal includedeb focal pgsql/focal/stash/*.deb
add-jammy:
	reprepro -b pgsql/jammy includedeb jammy pgsql/jammy/stash/*.deb
add-noble:
	reprepro -b pgsql/noble includedeb noble pgsql/noble/stash/*.deb
add-bookworm:
	reprepro -b pgsql/bookworm includedeb bookworm pgsql/bookworm/stash/*.deb
purge:
	rm -rf infra/stash/*.deb
	rm -rf pgsql/focal/stash/*.deb
	rm -rf pgsql/jammy/stash/*.deb
	rm -rf pgsql/noble/stash/*.deb
	rm -rf pgsql/bookworm/stash/*.deb
	rm -rf pgsql/bullseye/stash/*.deb
	rm -rf pgsty/focal/stash/*.deb
	rm -rf pgsty/jammy/stash/*.deb
	rm -rf pgsty/noble/stash/*.deb
	rm -rf pgsty/bookworm/stash/*.deb
	rm -rf pgsty/bullseye/stash/*.deb


ls-focal:
	reprepro -b pgsql/focal list focal
ls-jammy:
	reprepro -b pgsql/jammy list jammy
ls-noble:
	reprepro -b pgsql/noble list noble
ls-bookworm:
	reprepro -b pgsql/bookworm list bookworm
ls-bullseye:
	reprepro -b pgsql/bullseye list bullseye

# how to remove (e.g.)
# reprepro -b pgsql remove bookworm haproxy
# reprepro -b infra remove generic ferretdb

pgsql-include:
	reprepro -b pgsql includedeb bookworm stash/bookworm.amd64/postgresql-16*.deb
	reprepro -b pgsql includedeb jammy    stash/jammy.amd64/postgresql-16*.deb


sty-all: sty-focal sty-jammy sty-noble sty-bookworm sty-bullseye
sty-focal:
	reprepro -b pgsty/focal includedeb focal pgsty/focal/stash/*.deb
sty-jammy:
	reprepro -b pgsty/jammy includedeb jammy pgsty/jammy/stash/*.deb
sty-noble:
	reprepro -b pgsty/noble includedeb noble pgsty/noble/stash/*.deb
sty-bookworm:
	reprepro -b pgsty/bookworm includedeb bookworm pgsty/bookworm/stash/*.deb
sty-bullseye:
	reprepro -b pgsty/bullseye includedeb bullseye pgsty/bullseye/stash/*.deb

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
upload: cf-upload cos-upload

cf-upload: cf-infra cf-pgsql
cf-infra:
	rclone sync -P --transfers=8 ./infra/ $(CF_PATH)/infra/
cf-pgsql:
	rclone sync -P --transfers=8 ./pgsql/ $(CF_PATH)/pgsql/

cos-upload: cos-infra cos-pgsql
cos-infra:
	rclone sync -P --transfers=8 ./infra/ $(COS_PATH)/infra/
cos-pgsql:
	rclone sync -P --transfers=8 ./pgsql/ $(COS_PATH)/pgsql/

###############################################################
#                         Inventory                           #
###############################################################
.PHONY: init add-infra add-focal add-jammy add-noble add-bookworm add-bullseye \
	push pushd pull pulld \
	upload cf-upload cos-upload \
	cf-infra cf-pgsql cos-infra cos-pgsql