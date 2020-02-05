CC = cc
CFLAGS = -std=c99 -pedantic -Wall -Wno-deprecated-declarations
LDFLAGS = 

HDR =
SRC = main.c
OBJ = ${SRC:.c=.o}

all: options main

check: all scan-build valgrind

scan-build:
	scan-build --status-bugs ${CC} -c ${SRC}

valgrind: main
	valgrind --leak-check=full --trace-children=yes --error-exitcode=1 \
		./main

format:
	astyle --style=bsd --indent=tab --mode=c ${SRC} ${HDR}

options:
	@echo build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

main: ${OBJ}
	${CC} -o main ${OBJ} ${LDFLAGS}

clean:
	rm -f main *.orig ${OBJ}

.PHONY: all options clean check format
