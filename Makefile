default: gestvm uxnasm

CFLAGS= -Wall -pedantic -O3 -Iuxn -g
OBJ= gestvm.o main.o uxn/uxn.o l_gestvm.o
LIBS= -lsndkit
WORGLE=

ifeq ($(USE_MNOLTH), 1)
CFLAGS+= -I/usr/local/include/mnolth
LIBS= -lmnolth
endif

WORGLE=worgle/worgle

$(WORGLE): worgle/worgle.c
	$(CC) $(CFLAGS) $< -o $@

%.c: %.org $(WORGLE)
	$(WORGLE) -g -Werror $<

gestvm: $(OBJ)
	$(CC) $(CFLAGS) $^ -o $@ $(LIBS)

uxnasm: uxn/uxnasm.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	$(RM) gestvm
	$(RM) $(OBJ)
	$(RM) gestvm.c gestvm.h
	$(RM) uxnasm
	$(RM) worgle/worgle
