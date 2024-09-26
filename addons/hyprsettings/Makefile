PROG = hyprsettings

CC = gcc
CFLAGS = `pkg-config --cflags gtk+-3.0`
LIBS = `pkg-config --libs gtk+-3.0`
OPT = -O3

${PROG}: ${PROG}.c
	${CC} ${CFLAGS} ${LIBS} ${OPT} ${PROG}.c -o ${PROG}

clean:
	rm ${PROG}
