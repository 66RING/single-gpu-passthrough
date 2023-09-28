set -x

# modprobe -r vfio_pci
# modprobe -r vfio
# modprobe -r vfio_iommu_type1

virsh nodedev-reattach pci_0000_01_00_0
virsh nodedev-reattach pci_0000_01_00_1

modprobe nvidia
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia_drm

echo 1 > /sys/class/vtconsole/vtcon0/bind
#echo 1 > /sys/class/vtconsole/vtcon1/bind


#echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/bind

# systemctl start lxdm.service
