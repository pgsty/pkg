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
	mkdir -p polar polar/{focal,jammy,noble}

clean:
	rm -rf stash/*

add-all: add-focal add-jammy add-noble
add-focal:
	reprepro -b focal includedeb focal focal/stash/*.deb
add-jammy:
	reprepro -b jammy includedeb jammy jammy/stash/*.deb
add-noble:
	reprepro -b noble includedeb noble noble/stash/*.deb

ls-focal:
	reprepro -b focal list focal
ls-jammy:
	reprepro -b jammy list jammy
ls-noble:
	reprepro -b noble list noble
ls-bookworm:


# how to remove (e.g.)

# reprepro -b infra remove generic ferretdb
# reprepro -b pgsql/noble remove noble haproxy
# reprepro -b pgsql/bookworm remove bookworm postgresql-16-pg-analytics

pgsql-include:
	reprepro -b pgsql includedeb bookworm stash/bookworm.amd64/postgresql-16*.deb
	reprepro -b pgsql includedeb jammy    stash/jammy.amd64/postgresql-16*.deb


###############################################################
#                         Inventory                           #
###############################################################
.PHONY: init add-infra add-focal add-jammy add-noble add-bookworm add-bullseye \
	push pushd pull pulld \
	upload cf-upload cos-upload \
	cf-infra cf-pgsql cos-infra cos-pgsql