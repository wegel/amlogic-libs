CFLAGS = -fPIC -Wall -Wextra -O2 -g
CFLAGS += -I./ -I./include -I../amadec/include -I../amavutils/include -I../amplayer/player/include -I../amcodec/include
CFLAGS += -DALSA_OUT

ifdef DOLBY_UDC
    CFLAGS += -DDOLBY_USE_ARMDEC
endif

LDFLAGS = -L../amadec -L../amavutils -L../amplayer -L../amcodec
LDFLAGS += -lamcodec -ldl -lamadec -lasound -lamavutils
TARGET = esplayer

SRCS = esplayer.c
OBJS = $(SRCS:.c=.o)

.PHONY: all
all: ${TARGET}

$(TARGET): $(OBJS)
	$(CC) ${LDFLAGS} -o $@ $^

$(SRCS:.c=.d):%.d:%.c
	$(CC) $(CFLAGS) -MM $< >$@

include $(SRCS:.c=.d)

.PHONY: clean
clean:
	-rm -f ${TARGET} ${OBJS} $(SRCS:.c=.d)
