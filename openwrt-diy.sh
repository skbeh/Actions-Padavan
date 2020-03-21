#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
git clone https://github.com/jefferymvp/luci-app-koolproxyR package/luci-app-koolproxyR

# Clone 项目
mkdir package/luci-app-openclash
cd package/luci-app-openclash
git init
git remote add -f origin https://github.com/vernesong/OpenClash.git
git config core.sparsecheckout true
echo "luci-app-openclash" >> .git/info/sparse-checkout
git pull origin master
git branch --set-upstream-to=origin/master master

# 编译 po2lmo (如果有po2lmo可跳过)
pushd package/luci-app-openclash/luci-app-openclash/tools/po2lmo
make && sudo make install
popd
cd ../../

./scripts/feeds update -a
./scripts/feeds install -a

