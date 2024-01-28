#!/bin/bash -x 
nasm ./bootloader/boot.asm -o boot.bin
dd if=boot.bin of=/home/szb/boot.img  bs=512 count=1 conv=notrunc
cd bootloader
nasm loader.asm -o loader.bin
mv loader.bin ..
cd ..
sudo mount /home/szb/boot.img ./media/ -t vfat -o loop
sudo cp kernel/kernel.bin ./media/
sudo cp loader.bin ./media/
sudo sync
sudo umount ./media/
sudo bochs -f ../../bochsrc
