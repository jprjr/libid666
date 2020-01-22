.PHONY: clean all

CFLAGS = -Wall -Wextra -g -O2

all: libid666.a libid666.so

LIBID666_OBJS = \
	libid666.o \
	str.o \
	scan.o \
	char.o \
	unpack.o

dump: dump.o $(LIBID666_OBJS)
	$(CC) -o $@ $^ -lgme

test: test.o $(LIBID666_OBJS)
	$(CC) -o $@ $^ -lgme

libid666.so: $(LIBID666_OBJS)
	$(CC) -s -shared -o $@ $^

libid666.a: $(LIBID666_OBJS)
	ar rcs $@ $^

libid666.o: libid666.c
	$(CC) $(CFLAGS) -c -o $@ $^

unpack.o: unpack.c
	$(CC) $(CFLAGS) -c -o $@ $^

scan.o: scan.c
	$(CC) $(CFLAGS) -c -o $@ $^

str.o: str.c
	$(CC) $(CFLAGS) -c -o $@ $^

char.o: char.c
	$(CC) $(CFLAGS) -c -o $@ $^

cli.o: cli.c
	$(CC) $(CFLAGS) -c -o $@ $^

dump.o: dump.c
	$(CC) $(CFLAGS) -c -o $@ $^

clean:
	rm -f *.o *.a
