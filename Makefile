
ifeq ($(arm),1)
BUILDROOT_HOME=/home/richard/documents/school/2023Summer/buildroot-2023.02.1
CC=$(BUILDROOT_HOME)/output/host/usr/bin/arm-linux-gcc
CFLAGS=--sysroot=$(BUILDROOT_HOME)/output/staging
INCLUDES=
LFLAGS=
LIBS=-lcurl -uClibc -lc

CFLAGS+=-DARM

else
# CC=arm-linux-gnueabi-gcc
CC=gcc
CFLAGS=
INCLUDES=
LFLAGS=-L/usr/lib/x86_64-linux-gnu
LIBS=-lcurl -lpthread

endif

SRC=requestor.c
OBJ=$(SRC:.c=.o)
MAIN=test

RM=rm -rf

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(MAIN): $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJ) $(LFLAGS) $(LIBS)

all: $(MAIN)

clean:
	$(RM) $(MAIN) *.o *~