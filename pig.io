#!/bin/bash
set -o pipefail
#==============================================================#
# File      :   pig
# Desc      :   download & install pig cli
# Mtime     :   2025-01-12
# Path      :   https://repo.pigsty.io/pig (global, default)
# Usage     :   curl -fsSL https://repo.pigsty.io/pig | bash
# Deps      :   curl
# License   :   Apache-2.0
# Copyright :   2018-2025  Ruohang Feng / Vonng (rh@vonng.com)
#==============================================================#
DEFAULT_VERSION=0.1.2
BASEURL="https://repo.pigsty.io"

# To install the latest version of pig
# curl -fsSL https://repo.pigsty.io/pig | bash

# To install a specific version of pig
# curl -fsSL https://repo.pigsty.io/pig | bash -s 0.1.2

#--------------------------------------------------------------#
# Log Util
#--------------------------------------------------------------#
__CN='\033[0m';__CB='\033[0;30m';__CR='\033[0;31m';__CG='\033[0;32m';
__CY='\033[0;33m';__CB='\033[0;34m';__CM='\033[0;35m';__CC='\033[0;36m';__CW='\033[0;37m';
log_info() { printf "[${__CG}INFO${__CN}] ${__CG}%s${__CN}\n" "$*"; }
log_warn() { printf "[${__CY}WARN${__CN}] ${__CY}%s${__CN}\n" "$*"; }
log_error() { printf "[${__CR}FAIL${__CN}] ${__CR}%s${__CN}\n" "$*"; }
log_debug() { printf "[${__CB}HINT${__CN}] ${__CB}%s${__CN}\n" "$*"; }
log_input() { printf "[${__CM} IN ${__CN}] ${__CM}%s\n=> ${__CN}" "$*"; }
log_hint() { printf "${__CB}%s${__CN}" "$*"; }

#--------------------------------------------------------------#
# Param
#--------------------------------------------------------------#
OS_PACKAGE=""
ARCH=$(uname -m)
DOWNLOAD_URL=""
DOWNLOAD_TO=""
FILENAME=""

# arg1 > env > default
if [[ -n "$1" ]]; then
    VERSION="$1"
    VERSION_FROM="arg"
elif [[ -n "${PIG_VERSION}" ]]; then
    VERSION="${PIG_VERSION}"
    VERSION_FROM="env"
else
    VERSION=${DEFAULT_VERSION}
    VERSION_FROM="default"
fi


#----------------------------------------------#
# kernel
#----------------------------------------------#
check_kernel() {
    local kernel_name
    kernel_name=$(uname -s)
    if [[ "${kernel_name}" == "Linux" ]]; then
        log_info "kernel = ${kernel_name}"
    else
        log_error "kernel = ${kernel_name}, not supported, Linux only"
        exit 1
    fi
}

#----------------------------------------------#
# machine
#----------------------------------------------#
check_machine() {
    case "${ARCH}" in
        x86_64)
            log_info "machine = ${ARCH}"
            ;;
        aarch64)
            log_warn "machine = ${ARCH}"
            ;;
        *)
            log_error "machine = ${ARCH}, not supported, x86_64/aarch64 only"
            exit 2
            ;;
    esac
}

#----------------------------------------------#
# os package manager (yum|apt|...)
#----------------------------------------------#
check_package() {
    if command -v dpkg >/dev/null 2>&1; then
        OS_PACKAGE="deb"
    elif command -v rpm >/dev/null 2>&1; then
        OS_PACKAGE="rpm"
    else
        log_error "fail to determine os package type"
        exit 3
    fi
    log_info "package = ${OS_PACKAGE}"
}

#--------------------------------------------------------------#
# check pkg url
#--------------------------------------------------------------#
check_pkg_url() {
    case "${OS_PACKAGE}" in
        rpm)
            case "${ARCH}" in
                x86_64)
                    FILENAME="pig-${VERSION}-1.x86_64.rpm"
                    ;;
                aarch64)
                    FILENAME="pig-${VERSION}-1.aarch64.rpm"
                    ;;
            esac
            DOWNLOAD_URL="${BASEURL}/pkg/pig/v${VERSION}/${FILENAME}"
            ;;
        deb)
            case "${ARCH}" in
                x86_64)
                    FILENAME="pig_${VERSION}_amd64.deb"
                    ;;
                aarch64)
                    FILENAME="pig_${VERSION}_arm64.deb"
                    ;;
            esac
            DOWNLOAD_URL="${BASEURL}/pkg/pig/v${VERSION}/${FILENAME}"
            ;;
    esac
    DOWNLOAD_TO="/tmp/${FILENAME}"
    log_info "pkg_url = ${DOWNLOAD_URL}"
    log_info "get dst = ${DOWNLOAD_TO}"
}

#--------------------------------------------------------------#
# download file
#--------------------------------------------------------------#
# download file from url, if file already exists with same size, skip download
download_file() {
    local data_url=$1
    local data_file=$2

    log_hint "curl -fSL ${data_url} -o ${data_file}"
    echo ""

    # if file exists and have the exact same size, just use it and skip downloading
    if [[ -f ${data_file} ]]; then
        local size curl_size
        if [[ "$(uname)" == "Darwin" ]]; then
            size=$(stat -f %z "${data_file}")
        else
            size=$(stat -c %s "${data_file}")
        fi
        curl_size=$(curl -fsLI ${data_url} | grep -i 'Content-Length' | awk '{print $2}' | tr -d '\r')
        if [[ ${size} -eq ${curl_size} ]]; then
            log_warn "tarball = ${data_file} exists, size = ${size}, use it"
            return 0
        fi
    fi
    curl -# -fSL ${data_url} -o ${data_file}
}

#--------------------------------------------------------------#
# Main
#--------------------------------------------------------------#
check_kernel
check_machine
check_package
check_pkg_url

log_info "downloading ${DOWNLOAD_URL} to ${DOWNLOAD_TO}"
download_file "${DOWNLOAD_URL}" "${DOWNLOAD_TO}"

if [[ $? -ne 0 ]]; then
    log_error "fail to download ${DOWNLOAD_URL}"
    exit 2
fi

log_info "md5sums = $(md5sum ${DOWNLOAD_TO})"

# install it with os package manager
case "${OS_PACKAGE}" in
    rpm)
        log_info "sudo rpm -ivh ${DOWNLOAD_TO}"
        sudo rpm -ivh ${DOWNLOAD_TO}
        ;;
    deb)
        log_info "sudo dpkg -i ${DOWNLOAD_TO}"
        sudo dpkg -i ${DOWNLOAD_TO}
        ;;
esac

log_info "pig v${VERSION} installed"
log_hint "check https://ext.pigsty.io/#/pig"
echo ""