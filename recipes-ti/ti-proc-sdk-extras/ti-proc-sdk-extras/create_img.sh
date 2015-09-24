sudo dd if=/dev/zero of=boot.img bs=512 count=2097152

sudo mkfs.vfat -F 32 -n "boot" ./boot.img

# /mnt is mount point, boot.img is image
sudo mount ./boot.img /mnt 

sudo cp -f ../demos/image_processing/ipc/evmam572x/sd_card/* /mnt

sudo umount /mnt

