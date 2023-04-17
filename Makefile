REPO_LIBS?=https://github.com/falcosecurity/libs.git
REPO_BRANCH?=master

DBFLAGS=-g -O0 -DDEBUG
NDBFLAGS=-O2
CFLAGS=-Wall -Werror
OUTDIR=build
OUTPUT=$(OUTDIR)/scap_read

BUILD_LIBS=$(OUTDIR)/libs
INCLUDES+=-I $(BUILD_LIBS)/userspace/libscap
INCLUDES+=-I $(BUILD_LIBS)/userspace/libscap/engine/savefile

CFILES=scap_read.c read_proclist.c

all: debug

$(OUTDIR):
	mkdir -p $(OUTDIR)

debug: $(CFILES) $(OUTDIR) $(BUILD_LIBS)
	gcc $(CFLAGS) $(DBFLAGS) $(INCLUDES) -o $(OUTPUT) $(CFILES)

release: $(CFILES) $(OUTDIR) $(BUILD_LIBS)
	gcc $(CFLAGS) $(NDBFLAGS) $(INCLUDES) -o $(OUTPUT) $(CFILES)

$(BUILD_LIBS):
	git clone $(REPO_LIBS) -b $(REPO_BRANCH) $(BUILD_LIBS)

clean:
	-rm -rf $(OUTPUT) $(OUTDIR)

