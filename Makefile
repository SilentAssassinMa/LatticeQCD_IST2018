PREFIX=/usr/local
C++ = g++
C_FLAGS = -g -std=c++14 -O2 -Wall -Wextra -fopenmp
INCLUDES = -I$(PREFIX)/include -I./src
LIBRARIES = -llapack -lblas
FLAGS =  $(INCLUDES) $(LIBRARIES) $(C_FLAGS)

bin/main.exe: build/lattice.o build/main.o
	$(C++) build/main.o build/lattice.o -o bin/main.exe $(FLAGS)

build/main.o: build/lattice.o src/main.cc src/main.hh src/misc.hh
	$(C++) -c src/main.cc -o build/main.o $(FLAGS) 
	
build/lattice.o: src/lattice.cc src/lattice.hh src/misc.hh
	$(C++) -c src/lattice.cc -o build/lattice.o $(FLAGS)

clean:                                              
	rm ./*.o ./*~ ./\#* build/* bin/*