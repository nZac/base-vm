export KERN_DIR=/usr/src/kernels/`uname -r`

echo "creating tmp directory"
mkdir -p /mnt/virtualbox

echo "Mounting guest additions"
mount -o loop ~/VBoxGuestAdditions.iso /mnt/virtualbox

/mnt/virtualbox/VBoxLinuxAdditions.run --nox11

echo "unmounting guest additions"
umount /mnt/virtualbox

echo "removing guest additions"
rm ~/VBoxGuestAdditions.iso

