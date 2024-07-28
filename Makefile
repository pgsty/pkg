#==============================================================#
# File      :   Makefile
# Desc      :   pigsty shortcuts
# Ctime     :   2024-07-28
# Mtime     :   2024-07-28
# Path      :   Makefile
# Author    :   Ruohang Feng (rh@vonng.com)
# License   :   AGPLv3
#==============================================================#


###############################################################
#                       1. Publishing                         #
###############################################################
all:
	@echo "pgsty package repo"
cf-yum:
	rclone sync -P --transfers=8  repo/rpm/ cf:/repo/yum/
cf-apt:
	rclone sync -P --transfers=8  repo/deb/ cf:/repo/apt/
