CFLAGS = -fPIC -Wall -Wextra -O2 -g
CFLAGS += -I./ -I./include -I../amavutils/include -I../amplayer/player/include
CFLAGS += -DALSA_OUT

ifdef DOLBY_UDC
    CFLAGS += -DDOLBY_USE_ARMDEC
endif

LDFLAGS = -shared -lpthread -lm -lasound -lrt
TARGET_LIB = libamadec.so

SRCS = adec-external-ctrl.c adec-internal-mgt.c adec-ffmpeg-mgt.c adec-message.c adec-pts-mgt.c feeder.c adec_write.c adec_read.c\
           dsp/audiodsp-ctl.c audio_out/alsa-out.c audio_out/aml_resample.c audiodsp_update_format.c spdif_api.c pcmenc_api.c dts_transenc_api.c dts_enc.c audio_out/alsactl_parser.c \
           audio_out/alsa-out-raw.c
OBJS = $(SRCS:.c=.o)

.PHONY: all
all: ${TARGET_LIB}

$(TARGET_LIB): $(OBJS)
	$(CC) ${LDFLAGS} -o $@ $^

$(SRCS:.c=.d):%.d:%.c
	$(CC) $(CFLAGS) -MM $< >$@

include $(SRCS:.c=.d)

.PHONY: clean
clean:
	-${RM} ${TARGET_LIB} ${OBJS} $(SRCS:.c=.d)


#install:
#	-install -m 555 ${TARGET} $(INSTALL_DIR)
#	cp  -rf $(SRC)/include/*  $(HEADERS_DIR)/
#	cp  -rf $(SRC)/*.h  $(HEADERS_DIR)/

