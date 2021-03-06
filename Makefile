all: main acte1 acte2 acte3


CC=clang
CFLAGS=-g -Wall -Wextra -Werror -Wno-unused-parameter



tests_acte1: acte1
	@set -e; for f in `ls tests_acte1`; do ./acte1 tests_acte1/$$f; done; printf "\033[0;32mSuccès\033[0m sur l'acte I !\n"

tests_acte2: acte2
	@set -e; for f in `ls tests_acte2`; do ./acte2 tests_acte2/$$f; done; printf "\033[0;32mSuccès\033[0m sur l'acte II !\n"

tests_acte3: acte3
	@set -e; for f in `ls tests_acte3`; do ./acte3 tests_acte3/$$f; done; printf "\033[0;32mSuccès\033[0m sur l'acte III-A !\n"

OBJS= arbres.o arbresphylo.o listes.o common_tests.o
acte1: acte1.o $(OBJS)
acte2: acte2.o $(OBJS)
acte3: acte3.o $(OBJS)

.PHONY: tests_acte1 tests_acte2 tests_acte3

# Ici, on utilise l'"intelligence" de 'make' qui saura tout seul
# comment créer les .o à partir des .c
main: main.o arbresphylo.o arbres.o listes.o

dotcv: dot.c dot.h arbres.o arbres.h
	$(CC) -DDOT_CONVERT_MAIN arbres.o dot.c -o $@

clean:
	rm -f main dotcv *.o
