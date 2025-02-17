SRC=$(wildcard src/*.c)
OBJS=$(notdir $(SRC:.c=.o))

CC=gcc
CFLAGS=-std=gnu17 -ggdb -Wall -Werror -pedantic -DDEBUG
LDFLAGS=-lm

LIBSRC=$(wildcard lib/*.crust)
LIBOBJS=$(LIBSRC:.crust=.o)
AR=ar
ARFLAGS=rc

CRUSTC=./crust
CRUSTFLAGS=--obj

all: crust

crust: $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

%.o: src/%.c src/%.h
	$(CC) $(CFLAGS) -c $< -o $@ $(LDFLAGS)

stdlib: $(LIBOBJS)
	$(AR) $(ARFLAGS) lib/libstdcrust.a $^

lib/%.o: lib/%.crust
	$(CRUSTC) $(CRUSTFLAGS) $<

clean:
	-rm *.o crust
	-rm lib/*.o lib/libstdcrust.a

install: crust stdlib
	cp crust /bin
	mkdir -p /usr/share/crust
	cp -r lib /usr/share/crust

uninstall:
	rm /bin/crust
	rm -rf /usr/share/crust

