TARGET = libdcs605.so
OBJ_PATH = objs
PREFIX_BIN =

CC = g++
#CC = mips64-octeon-linux-gnu-g++
INCLUDES = -I include 
LIBS = -lpthread  
CFLAGS =-Wall -O2 -g  -fPIC #-DMIPSBE#-Werror
LINKFLAGS = -Wl,-rpath=./ -shared -Wl,--retain-symbols-file=libdcs605.def -Wl,--version-script=libdcs605.map  
   
#SRCDIR = src/json src
SRCDIR = .

#C_SOURCES = $(wildcard *.c)
C_SRCDIR = $(SRCDIR)
C_SOURCES = $(foreach d,$(C_SRCDIR),$(wildcard $(d)/*.c) )
C_OBJS = $(patsubst %.c, $(OBJ_PATH)/%.o, $(C_SOURCES))

#CPP_SOURCES = $(wildcard *.cpp)
CPP_SRCDIR = $(SRCDIR)
CPP_SOURCES = $(foreach d,$(CPP_SRCDIR),$(wildcard $(d)/*.cpp) )
CPP_OBJS = $(patsubst %.cpp, $(OBJ_PATH)/%.o, $(CPP_SOURCES))

default:init compile

$(C_OBJS):$(OBJ_PATH)/%.o:%.c
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

$(CPP_OBJS):$(OBJ_PATH)/%.o:%.cpp
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

init:
	$(foreach d,$(SRCDIR), mkdir -p $(OBJ_PATH)/$(d);)

test:
	@echo "C_SOURCES: $(C_SOURCES)"
	@echo "C_OBJS: $(C_OBJS)"
	@echo "CPP_SOURCES: $(CPP_SOURCES)"
	@echo "CPP_OBJS: $(CPP_OBJS)"

compile:$(C_OBJS) $(CPP_OBJS)
	$(CC)  $^ -o $(TARGET)  $(LINKFLAGS) $(LIBS)

clean:
	rm -rf $(OBJ_PATH)
	rm -f $(TARGET)

install: $(TARGET)
	cp $(TARGET) $(PREFIX_BIN)

uninstall:
	rm -f $(PREFIX_BIN)/$(TARGET)

rebuild: clean init compile

