TARGET= fletcher

C_SOURCES =

OPTS=  -std=gnu++23 -static
OPTS+= -Wfatal-errors
WINOPTS=  -lstdc++exp  -static-libgcc 
HOST= $(shell hostname)

DEFINES= -D__BUILD_HOST=\"$(HOST)\"
CFLAGS=-Os -ffunction-sections -fdata-sections $(DEFINES)
LDFLAGS=-Wl,-s  -Wl,--gc-sections

C_OBJECTS = $(patsubst %.c, %.c.o, $(C_SOURCES))
C_OBJECTS_WIN = $(patsubst %.c, %.c.obj, $(C_SOURCES))

all: $(TARGET)
exe: $(TARGET).exe

# Linuxprogramm
$(TARGET): $(TARGET).cpp  $(C_OBJECTS)
	c++    $(OPTS) $(CFLAGS) $(LDFLAGS)   $(TARGET).cpp  $(C_OBJECTS)  -o $(TARGET)
	strip  $(TARGET)


# Windowsprogramm 64 Bit
#$(TARGET).exe: $(TARGET).cpp
#	x86_64-w64-mingw32-c++ $(OPTS) $(TARGET).cpp  -lstdc++exp   -o $(TARGET).exe

# Windowsprogramm 32 Bit, statisch
$(TARGET).exe: $(TARGET).cpp
	i686-w64-mingw32-c++  $(OPTS) $(CFLAGS) $(LDFLAGS) $(TARGET).cpp $(WINOPTS) -o $(TARGET).exe
	i686-w64-mingw32-strip   $(TARGET).exe

# C (Linux)
%.c.o : %.c
	$(CC) -c $(CCFLAGS) -o $@ $<

# C (Windows)
%.c.obj : %.c
	i686-w64-mingw32-cc -c $(CCFLAGS) -o $@ $<

clean:
	rm -f $(TARGET)
	rm -f $(TARGET).exe
	rm -f $(C_OBJECTS)
