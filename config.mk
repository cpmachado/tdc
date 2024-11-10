# configuration of system

VERSION = 0.0.1-dev

# installation
PREFIX ?= /usr/local
MANPREFIX = ${PREFIX}/share/man

CC      ?= gcc
INC     += -I. -I/usr/include -I./include
CFLAGS  += -g -W -Wall -Werror -std=c99 -pedantic -Wno-unused-result ${INC}
CPPFLAGS =\
	-DVERSION=\"${VERSION}\"\
	-D_BSD_SOURCE\
	-D_DEFAULT_SOURCE\
	-D_POSIX_C_SOURCE=200809L
LDFLAGS = -lc
