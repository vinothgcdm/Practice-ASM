FILE ?= test

all: $(FILE).bin
	dd if=/dev/zero of=flash.bin bs=4096 count=4096
	dd if=$(FILE).bin of=flash.bin bs=4096 conv=notrunc

%.bin: %.elf
	arm-none-eabi-objcopy -O binary $< $@

%.elf: %.o
	arm-none-eabi-ld -Ttext=0x0 -o $@ $<

%.o: %.s
	arm-none-eabi-as -o $@ $<

clean:
	rm *.bin
