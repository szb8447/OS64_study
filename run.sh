#!/bin/bash -x 
nasm boot.asm -o boot.bin
dd if=boot.bin of=/home/szb/boot.img  bs=512 count=1 conv=notrunc
nasm loader.asm -o loader.bin
sudo mount /home/szb/boot.img ./media/ -t vfat -o loop
sudo cp loader.bin ./media/
sudo sync
sudo umount ./media/
sudo bochs -f ../../bochsrc
