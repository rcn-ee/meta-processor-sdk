EXE = barcode_zbar

CFLAGS = -g -O3 -DENABLED_PNG -I$(TARGET_ROOTDIR)/usr/include -I../include
LD_FLAGS=-L$(TARGET_ROOTDIR)/lib -L$(TARGET_ROOTDIR)/usr/lib -L../zbar/.libs -Wl,-rpath-link,$(TARGET_ROOTDIR)/lib -Wl,-rpath-link,$(TARGET_ROOTDIR)/usr/lib -Wl,-rpath-link,../zbar/.libs
ZBARLIB=-lzbar -lpng -ljpeg -pthread

scan_image.o: scan_image.c
	@$(CC) -c $(CFLAGS) $<
	@echo Compiling $<

$(EXE): scan_image.o
	$(CC) $(LD_FLAGS) $(ZBARLIB) scan_image.o -o $@
	@echo Linking $<

clean:
	@rm -f $(EXE) *.o
