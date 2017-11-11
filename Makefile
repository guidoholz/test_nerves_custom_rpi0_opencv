PROG=opencvtest
DEFAULT_TARGETS ?= priv priv/opencvtest

OPENCV_CFLAGS = -I$(NERVES_SDK_SYSROOT)/usr/include
OPENCV_LDFLAGS = -L$(NERVES_SDK_SYSROOT)/usr/lib -lopencv_core -lopencv_imgproc -lstdc++

LDFLAGS +=
CFLAGS ?= -O2 -Wall -Wextra -Wno-unused-parameter
CC ?= $(CROSSCOMPILE)-gcc

SRC=$(wildcard src/*.cpp)
OBJ=$(SRC:.cpp=.o)

.PHONY: all clean

all: $(DEFAULT_TARGETS)

%.o: %.cpp
	$(CC) -c $(OPENCV_CFLAGS) $(CFLAGS) -o $@ $<

priv:
	mkdir -p priv

priv/$(PROG): $(OBJ)
	$(CC) $^ $(OPENCV_LDFLAGS) $(LDFLAGS) -o $@

clean:
	rm -f priv/$(PROG) src/*.o
