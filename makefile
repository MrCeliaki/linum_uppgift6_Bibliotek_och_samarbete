CC=gcc
OBJS= component.o resistance.o power.o main.o
LIBS= libcomponent.so libresistance.so libpower.so

all: lib eletrotest

lib: $(OBJS) $(LIBS)

install: lib eletrotest
	sudo cp eletrotest /usr/bin

uninstall:
	sudo rm /usr/lib/libcomponent.so 
	sudo rm /usr/lib/libresistance.so 
	sudo rm /usr/lib/libpower.so 
	sudo rm /usr/bin/eletrotest

clean:
	rm -v *.o *.so eletrotest

eletrotest: install_libs
	$(CC) -o $@ main.c -Wl,-rpath,/usr/lib -L/usr/lib -lpower -lresistance -lcomponent 

install_libs: lib
	sudo cp libcomponent.so /usr/lib
	sudo cp libresistance.so /usr/lib
	sudo cp libpower.so /usr/lib

%.o: %.c %.h
	$(CC) -c $< -o $@

lib%.so: %.o
	$(CC) -shared -fPIC -o $@ $< 