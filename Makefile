SHELL := /bin/bash
#
# calcmarks, version 1, released Fri May  8 11:20:00 AWST 2020
#
calcmarks : calcmarks.o globals.o readmarks.o correlation.o
	cc -std=c99 -Wall -pedantic -Werror -o calcmarks \
		calcmarks.o globals.o readmarks.o correlation.o -lm


calcmarks.o : calcmarks.c calcmarks.h
	cc -std=c99 -Wall -pedantic -Werror -c calcmarks.c

globals.o : globals.c calcmarks.h
	cc -std=c99 -Wall -pedantic -Werror -c globals.c

readmarks.o : readmarks.c calcmarks.h
	cc -std=c99 -Wall -pedantic -Werror -c readmarks.c

correlation.o : correlation.c calcmarks.h
	cc -std=c99 -Wall -pedantic -Werror -c correlation.c

clean:
	rm -f *.o calcmarks
update_vn:
	./updateversion calcmarks