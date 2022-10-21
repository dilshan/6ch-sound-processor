TARGET = 6ch-tone-control

CC = gcc
RES = glib-compile-resources

OPT = -O0 -DENABLE_LOG_INFO
WARN = -Wall

PTHREAD = -pthread

CCFLAGS = $(Debug) $(OPT) $(WARN) $(PTHREAD)
OBJS = main.o logger.o devcnt.o resources.o

GTKLIB = `pkg-config --cflags --libs gtk+-3.0`

LD = gcc
LDFLAGS = $(PTHREAD) $(GTKLIB) -export-dynamic

all: $(OBJS)
	$(LD) -o $(TARGET) $(OBJS) $(LDFLAGS)

devcnt.o: src/devcnt.c
	$(CC) -c $(CCFLAGS) src/devcnt.c $(GTKLIB) -o devcnt.o

main.o: src/main.c
	$(CC) -c $(CCFLAGS) src/main.c $(GTKLIB) -o main.o

logger.o: src/logger.c
	$(CC) -c $(CCFLAGS) src/logger.c $(GTKLIB) -o logger.o

resources.o: 
	$(RES) src/images/6ch-tone-control.gresource.xml --generate-source --target=src/resources.c
	$(CC) -c $(CCFLAGS) src/resources.c $(GTKLIB) -o resources.o

clean:
	rm -f *.o
	rm $(TARGET)
	rm src/resources.c