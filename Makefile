all: main.o add.o
	g++ -o test.out main.o add.o
main.o:main.cpp add.h
	g++ -c -o main.o main.cpp
add.o: add.cpp add.h
	g++ -c -o add.o add.cpp
clean:
	rm *.o *.out