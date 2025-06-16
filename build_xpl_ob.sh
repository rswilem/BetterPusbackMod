#!/bin/bash

./build_xpl.sh
./install_xplane.sh

echo "copying mac_x64/BetterPushback.xpl to ~/X-Plane\ 11/Resources/plugins/BetterPushback/mac_x64/BetterPushback.xpl"
cp mac_x64/BetterPushback.xpl ~/X-Plane\ 11/Resources/plugins/BetterPushback/mac_x64/BetterPushback.xpl
echo "removing quarantine"
xattr -dr com.apple.quarantine ~/X-Plane\ 11/Resources/plugins/BetterPushback/mac_x64/BetterPushback.xpl

echo "copying BetterPushback_doors.cfg to ~/X-Plane\ 12/Resources/plugins/BetterPushback/BetterPushback_doors.cfg"
cp BetterPushback_doors.cfg ~/X-Plane\ 12/Resources/plugins/BetterPushback/BetterPushback_doors.cfg

