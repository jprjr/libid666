.PHONY: clean all install

OPT_CFLAGS =
OPT_LDFLAGS =
CFLAGS = -Wall -Wextra -g -O2 -fPIC

STATIC_PREFIX=lib
DYNLIB_PREFIX=lib
STATIC_EXT=.a
DYNLIB_EXT=.so

CC = cc

ID666_A = $(STATIC_PREFIX)id666$(STATIC_EXT)
ID666_SO = $(DYNLIB_PREFIX)id666$(DYNLIB_EXT)

DESTDIR=
PREFIX=/usr/local
LIBDIR=$(DESTDIR)$(PREFIX)/lib
INCDIR=$(DESTDIR)$(PREFIX)/include/id666

all: $(ID666_A) $(ID666_SO)

ID666_OBJS = id666.o

ID666_HEADERS = id666.h

id6-dump: id6-dump.o $(ID666_OBJS)
	$(CC) -o $@ $^

id6-gme-test: id6-gme-test.o $(ID666_OBJS)
	$(CC) -o $@ $^ -lgme

$(ID666_SO): $(ID666_OBJS)
	$(CC) -shared -o $@ $^ $(OPT_LDFLAGS)

$(ID666_A): $(ID666_OBJS)
	$(AR) rcs $@ $^

%.o: %.c
	$(CC) $(CFLAGS) $(OPT_CFLAGS) -o $@ -c $<

clean:
	rm -f *.o *.a *.dll *.so id6-dump id6-gme-test

install: $(ID666_A) $(ID666_SO)
	install -d $(LIBDIR)/
	install -m 644 $(ID666_A) $(LIBDIR)/$(ID666_A)
	install -m 755 $(ID666_SO) $(LIBDIR)/$(ID666_SO)
	install -d $(INCDIR)/
	install -m 644 $(ID666_HEADERS) $(INCDIR)/
