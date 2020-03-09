#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
clone https://github.com/jefferymvp/luci-app-koolproxyR package/luci-app-koolproxyR
./scripts/feeds update -a
./scripts/feeds install -a
