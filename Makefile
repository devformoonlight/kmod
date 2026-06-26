# License 

obj-m += kmod.o

KERNELRELEASE	?= $(shell uname -r)
KDIR	?= /lib/modules/${KERNELRELEASE}/build
MDIR	?= /lib/modules/${KERNELRELEASE}
PWD	:= $(shell pwd)

.PHONY : all clean install uninstall

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

install:
	rm -f ${MDIR}/updates/kmod.ko
	install -m644 -b -D kmod.ko ${MDIR}/updates/kmod.ko
	depmod -aq

uninstall:
	rm -f ${MDIR}/updates/kmod.ko
	depmod -aq

