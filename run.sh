#!/bin/bash

set -xue

# QEMU file path
QEMU=qemu-system-riscv32

CC=/usr/bin/clang
# CC=/usr/local/opt/llvm/bin/clang

# option settings
CFLAGS="-std=c11 -O2 -g3 -Wall -Wextra --target=riscv32-unknown-elf -ffreestanding -nostdlib"

# kernel build
# -Wl,-Tkernel.ld: Specifying Linker Scripts
# -Wl,-Map=kernel.map: Output map file (result of linker placement)
${CC} ${CFLAGS} -Wl,-Tkernel.ld -Wl,-Map=kernel.map -o kernel.elf kernel.c

# run QEMU
${QEMU} -machine virt -bios default -nographic -serial mon:stdio --no-reboot
