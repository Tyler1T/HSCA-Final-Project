# 
# ECEN 4233
# Makefile
# 

CC     = gcc
CFLAGS = -lm
LIBS   = 
OBJS1  = disp.o gdiv.o 
OBJS2  = disp.o gsqrt.o

all:		gdiv

gdiv:		$(OBJS1)
		$(CC) -g -o gdiv $(OBJS1) $(CFLAGS)

disp.o:		disp.h disp.c
		$(CC) -g -c -o disp.o disp.c 

gdiv.o:		gdiv.c
		$(CC) -g -c -o gdiv.o gdiv.c 

clean:
		rm -f *.o *~
		rm -f core
