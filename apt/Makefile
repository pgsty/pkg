#==============================================================#
# File      :   Makefile
# Desc      :   apt repo shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-12-12
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
add-bullseye:
	reprepro -b pgsql/bullseye includedeb bullseye pgsql/bullseye/stash/*.deb

adda: add-jammy add-noble add-bookworm

purge:
	rm -rf infra/stash/*.deb
	rm -rf pgsql/focal/stash/*.deb
	rm -rf pgsql/jammy/stash/*.deb
	rm -rf pgsql/noble/stash/*.deb
	rm -rf pgsql/bookworm/stash/*.deb
	rm -rf pgsql/bullseye/stash/*.deb

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
# reprepro -b infra remove generic pig
# reprepro -b pgsql/bookworm remove bookworm xxxx
# reprepro -b pgsql/jammy remove jammy xxxx
# reprepro -b pgsql/noble remove noble postgresql-17-pg-search
# reprepro -b pgsql/noble remove noble postgresql-16-pg-search
# reprepro -b pgsql/noble remove noble postgresql-15-pg-search
# reprepro -b pgsql/noble remove noble postgresql-14-pg-search

pgsql-include:
	reprepro -b pgsql includedeb bookworm stash/bookworm.amd64/postgresql-16*.deb
	reprepro -b pgsql includedeb jammy    stash/jammy.amd64/postgresql-16*.deb


init-all: init-focal init-jammy init-noble init-bookworm init-bullseye
init-focal:
	rm -rf pgsql/focal/{db,dists,pool}
	reprepro -b pgsql/focal includedeb focal ~/pgsty/apt/focal/*.deb
init-jammy:
	rm -rf pgsql/jammy/{db,dists,pool}
	reprepro -b pgsql/jammy includedeb jammy ~/pgsty/apt/jammy/*.deb
init-noble:
	rm -rf pgsql/noble/{db,dists,pool}
	reprepro -b pgsql/noble includedeb noble ~/pgsty/apt/noble/*.deb
init-bookworm:
	rm -rf pgsql/bookworm/{db,dists,pool}
	reprepro -b pgsql/bookworm includedeb bookworm ~/pgsty/apt/bookworm/*.deb
init-bullseye:
	rm -rf pgsql/bullseye/{db,dists,pool}
	reprepro -b pgsql/bullseye includedeb bullseye ~/pgsty/apt/bullseye/*.deb

gen:
	list/gen
	git diff list/*

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
upload-infra: cf-infra cos-infra
upload-pgsql: cf-pgsql cos-pgsql

cf-upload: cf-infra cf-pgsql
cf-infra:
	rclone sync -P --transfers=8 ./infra/ $(CF_PATH)/infra/
cf-pgsql:
	rclone sync -P --transfers=8 ./pgsql/ $(CF_PATH)/pgsql/

cf-jammy:
	rclone sync -P --transfers=8 ./pgsql/jammy/ $(CF_PATH)/pgsql/jammy/
cf-noble:
	rclone sync -P --transfers=8 ./pgsql/noble/ $(CF_PATH)/pgsql/noble/
cf-focal:
	rclone sync -P --transfers=8 ./pgsql/focal/ $(CF_PATH)/pgsql/focal/
cf-bookworm:
	rclone sync -P --transfers=8 ./pgsql/bookworm/ $(CF_PATH)/pgsql/bookworm/
cf-bullseye:
	rclone sync -P --transfers=8 ./pgsql/bullseye/ $(CF_PATH)/pgsql/bullseye/

cf-mssql:
	rclone sync -P --transfers=8 ./mssql/ $(CF_PATH)/mssql/


cos-upload: cos-infra cos-pgsql
cos-infra:
	rclone sync -P --transfers=8 ./infra/ $(COS_PATH)/infra/
cos-pgsql:
	rclone sync -P --transfers=8 ./pgsql/ $(COS_PATH)/pgsql/

cos-jammy:
	rclone sync -P --transfers=8 ./pgsql/jammy/ $(COS_PATH)/pgsql/jammy/
cos-noble:
	rclone sync -P --transfers=8 ./pgsql/noble/ $(COS_PATH)/pgsql/noble/
cos-focal:
	rclone sync -P --transfers=8 ./pgsql/focal/ $(COS_PATH)/pgsql/focal/
cos-bookworm:
	rclone sync -P --transfers=8 ./pgsql/bookworm/ $(COS_PATH)/pgsql/bookworm/
cos-bullseye:
	rclone sync -P --transfers=8 ./pgsql/bullseye/ $(COS_PATH)/pgsql/bullseye/

cos-mssql:
	rclone sync -P --transfers=8 ./mssql/ $(COS_PATH)/mssql/


###############################################################
#                         Inventory                           #
###############################################################
.PHONY: init add-infra add-focal add-jammy add-noble add-bookworm add-bullseye \
	push pushd pull pulld \
	upload cf-upload cos-upload \
	cf-infra cf-pgsql cos-infra cos-pgsql