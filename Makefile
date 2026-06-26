# License 

obj-m += test.o

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
	rm -f ${MDIR}/updates/test.ko
	install -m644 -b -D test.ko ${MDIR}/updates/test.ko
	depmod -aq

uninstall:
	rm -f ${MDIR}/updates/test.ko
	depmod -aq

