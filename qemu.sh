#!/bin/sh
qemu-system-arm -M connex -pflash flash.bin -nographic -serial /dev/null
