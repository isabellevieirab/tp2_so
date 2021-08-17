IDIR=lib
CC=g++
CFLAGS=-g -Wall -lpthread -I$(IDIR)
TFLAGS=-g -Wall -I$(IDIR)

ODIR=out
SDIR=src


TARGET=tp2virtual

#_DEPS = table.h
#DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = main.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: $(SDIR)/%.cpp #$(DEPS)
	mkdir -p $(ODIR) && $(CC) -c -o $@ $< $(CFLAGS)

$(TARGET): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)


.PHONY: clean

clean:
	rm -f $(ODIR)/*.o
	rm -f $(TARGET)
