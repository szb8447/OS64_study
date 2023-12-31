    org 0x7c00
BaseOfStack equ 0x7c00
BaseOfLoader equ 0x1000
OffsetOfLoader equ 0x00

RootDirSectors equ 14
SectorNumOfRootDirStart equ 19
SectorNumOfFAT!Start equ 1
SectorBalance equ 17

    jmp short Label_Start
    nop
    BS_OEMName db 'MINEboot'
    BPB_BytesPerSec dw 512
    BPB_SecPerClus db 1
    BPB_RsvdSecCnt dw 1
    BPB_NumFATs db 2
    BPB_RootEntCnt dw 224
    BPB_TotSec16 dw 2880
    BPB_Media db 0xf0
    BPB_FATSz16 dw 9
    BPB_SecPerTrk dw 18
    BPB_NumHeads db 2
    BPB_HiddSec dw 0
    BPB_TotSec32 dw 0
    BS_DrvNum db 0
    BS_Reserved1 db 1
    BS_Bootsig db 29h
    BS_VolID dd 0
    BS_VolLab db      'boot loader'
    BS_FileSysType db 'FAT12   '
Label_Start:

    mov ax, cx
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, BaseOfStack

;========清屏

    mov ax, 0600h
    mov bx, 0700h
    mov cx, 0
    mov dx, 0184fh
    int 10h

;========设置光标位置

    mov ax, 0200h
    mov bx, 0000h
    mov dx, 0000h
    int 10h

;========屏幕显示原神启动

    mov ax, 1301h
    mov bx, 000fh
    mov dx, 0000h
    mov cx, 10
    push ax
    mov ax, ds
    mov es, ax
    pop ax
    mov bp, StartBootMessage
    int 10h

;=======软盘驱动器复位

    xor ah, ah
    xor dl,dl
    int 13h

    jmp $
StartBootMessage: db "yuanshen!? qidong!"  
;======用0填充本节

    times 510 - ($ - $$) db 0
    dw 0xaa55