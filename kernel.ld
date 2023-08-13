ENTRY(boot)

SECTIONS {
    . = 0x80200000;

    /* code area */
    .text : {
        KEEP(*(.text.boot));
        *(.text .text*);
    }

    /* constant data area, read only */
    .rodata : ALIGN(4) {
        *(.rodata .rodata.*);
    }

    /* read-write data area */
    .data : ALIGN(4) {
        *(.data .data.*);
    }

    /* read-write data area, variables with initial value of zero */
    .bss : ALIGN(4) {
        __bss = .;
        *(.bss .bss.* .sbss .sbss.*);
        __bss_end = .;
    }

    . = ALIGN(4);
    . += 128 * 1024; /* 128 KB */
    __stack_top = .;
}
