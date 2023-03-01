CC=gcc
LIBS= component.o resistance.o power.o

# all, För att bygga både programmet och biblioteken där biblioteken läggs i en egen katalog, lib,  under den man är jus nu, tex /home/bl/electro/lib/. Här ska programmet länkas för att använda de lokala biblioteken. OBS! Ni får inte temporärt ändra libsökvägarna i LD_LIBRARY_PATH!
all: eletrotest

# lib, för att bygga enbart biblioteken.
lib: $(LIBS)
	$(CC) -shared -fPIC -o libcomponent.so component.o
	$(CC) -shared -fPIC -o libresistance.so resistance.o
	$(CC) -shared -fPIC -o libpower.so power.o


# install. Här kopierar du både programmet och biblioteken till lämpliga kataloger (tex /usr/bin/ och /usr/lib/) och länkar så att programmet använder de publika biblioteken.
install:

#clean. För att städa bort objekt- och exekverbara filer.
clean:
	rm -v *.o *.so eletrotest

eletrotest:
	$(CC) -o $@ main.c -L. -lpower -lresistance -lcomponent  -Wl,-rpath,.