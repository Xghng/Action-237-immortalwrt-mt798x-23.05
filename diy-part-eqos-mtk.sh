#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

# 修改默认主题
sed -i 's/luci-theme-bootstrap/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/ImmortalWrt/ImmortalWrt/g' package/base-files/files/bin/config_generate

# Modify filename, add date prefix
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(shell date +"%Y%m%d")-eqos-mtk-/1' include/image.mk

# Modify ppp-down, add sleep 3. my source code is change, no need this
sed -i '$a\\sleep 3' package/network/services/ppp/files/lib/netifd/ppp-down