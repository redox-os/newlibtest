prefix ?= /usr/local
bindir = $(prefix)/bin

BINS=true

all: $(BINS)

install: $(BINS)
	for bin in $(BINS); \
	do \
		install -D -m 0755 "$$bin" "$(DESTDIR)$(bindir)/newlibtest_$$bin"; \
	done

clean:
	rm -f $(BINS)

%: %.c
	$(CC) $(CFLAGS) $< -o $@ $(LIBS)
