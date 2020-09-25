all:
	-$(MAKE) -C amadec all
	-$(MAKE) -C amavutils all
	-$(MAKE) -C amcodec all
	-$(MAKE) -C example all

clean:
	-$(MAKE) -C amadec clean
	-$(MAKE) -C amavutils clean
	-$(MAKE) -C amcodec clean
	-$(MAKE) -C example clean

