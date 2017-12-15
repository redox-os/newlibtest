prefix ?= /usr/local
bindir = $(prefix)/bin

BINS=\
	netdb \
	true

all: $(BINS)

install: $(BINS)
	for bin in $(BINS); \
	do \
		install -D -m 0755 "$$bin" "$(DESTDIR)$(bindir)/newlibtest_$$bin"; \
	done

clean:
	rm -f $(BINS) lib.o

%: %.c lib.o
	$(CC) $(CFLAGS) $(CRT) lib.o $< -o $@ $(CLIBS)
	objdump -C -M intel -D $@ > $*.list

lib.o: lib.c
	$(CC) $(CFLAGS) -c $< -o $@
