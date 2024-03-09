 #include "task.h"
 #include "ptrace.h"
 #include "printk.h"
 #include "lib.h"
 #include "memory.h"
 #include "linkage.h"              
  
unsigned long init(unsigned long arg)
{
    color_printk(RED,BLACK,"init task is running,arg:%#0181x\n",arg);
    
    return 1;
}

unsigned long do_fork(struct pt_regs* regs, unsigned long clone_flags, unsigned long stack_start,
unsigned long stack_size)
{
    
}