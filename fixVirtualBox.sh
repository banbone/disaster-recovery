#! /bin/bash
echo "Running kernel driver scripts"
kextload -b org.virtualbox.kext.VBoxDrv
kextload -b org.virtualbox.kext.VBoxNetFlt
kextload -b org.virtualbox.kext.VBoxNetAdp
kextload -b org.virtualbox.kext.VBoxUSB
echo "All done!"
