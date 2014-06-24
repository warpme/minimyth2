DESTDIR ?=
prefix  ?= /usr
bindir  ?= $(prefix)/bin

SDL_CONFIG ?= sdl-config

SDL_CFLAGS ?= $(shell $(SDL_CONFIG) --cflags)
SDL_LIBS   ?= $(shell $(SDL_CONFIG) --libs)

CXX      ?= g++
CXXFLAGS += $(SDL_CFLAGS) $(SDL_LIBS)

all: SDL-Test

install: all
	mkdir -p $(DESTDIR)$(bindir)
	cp -f SDL-Test $(DESTDIR)$(bindir)/SDL-Test
