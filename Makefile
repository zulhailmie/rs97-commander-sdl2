CC ?= g++
target = DinguxCommander

RESDIR ?= /opt/dingux/res/
FILE_SYSTEM ?= /roms
PATH_DEFAULT ?= /roms
PATH_DEFAULT_RIGHT ?= /roms

# set variables for the OGA screen
SCREENW := 480
SCREENH := 320
FONTSIZE := 10
HEADERH := 17
H_PADDING_TOP := 3
FOOTERH := 13
F_PADDING_TOP := 1
LINEH := 15
FONTTOUSE := $(RESDIR)/Fiery_Turk.ttf
VIEWER_LINE_H := 13


SRCS=$(wildcard ./*.cpp)
OBJS=$(patsubst %cpp,%o,$(SRCS))

INCLUDE = -I/usr/include/SDL2
#INCLUDE =  $(shell /usr/bin/sdl2-config --cflags)
#LIB = -L/usr/lib -lSDL2 -lSDL2_image -lSDL2_ttf 
#LIB = -lSDL2 -lSDL2_image -lSDL2_ttf -lSDL2_gfx
LIB = $(shell /usr/bin/sdl2-config --libs) -lSDL2_image -lSDL2_ttf -lSDL2_gfx

all:$(OBJS)
	$(CC) $(OBJS) -o $(target) $(LIB) -lstdc++

%.o:%.cpp
	$(CC) -DRES_DIR="\"$(RESDIR)\"" -DODROID_GO_ADVANCE -DFILE_SYSTEM="\"$(FILE_SYSTEM)\"" -DSCREEN_WIDTH=$(SCREENW) -DSCREEN_HEIGHT=$(SCREENH) -DFONT_SIZE=$(FONTSIZE) -DHEADER_H=$(HEADERH) -DHEADER_PADDING_TOP=$(H_PADDING_TOP) -DFOOTER_H=$(FOOTERH) -DFOOTER_PADDING_TOP=$(F_PADDING_TOP) -DLINE_HEIGHT=$(LINEH) -DPATH_DEFAULT="\"$(PATH_DEFAULT)\"" -DPATH_DEFAULT_RIGHT="\"$(PATH_DEFAULT_RIGHT)\"" -DFONT_TO_USE="\"$(FONTTOUSE)\"" -DVIEWER_LINE_HEIGHT=$(VIEWER_LINE_H) -c $< -o $@  $(INCLUDE) 

clean:
	rm $(OBJS) $(target) -f

