    org 0x7c00
BaseOfStack equ 0x7c00

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