set -x

# systemctl stop lxdm.service
# killall lxdm-session
killall bspwm

sleep 4

modprobe -r nvidia_drm
modprobe -r nvidia_uvm
modprobe -r nvidia_modeset
modprobe -r nvidia

echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind

#echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

sleep 2

virsh nodedev-detach pci_0000_01_00_0
virsh nodedev-detach pci_0000_01_00_1

modprobe vfio-pci
# modprobe vfio
# modprobe vfio_iommu_type1
