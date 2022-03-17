

all: salida

salida: main.o VisitantePrecio.o VisitantePrecioDetalle.o Equipo.o Disco.o Bus.o Tarjeta.o
	g++ -o $@ $^


main.o:
	g++ -c main.cpp

VisitantePrecio.o:
	g++ -c VisitantePrecio.cpp

VisitantePrecioDetalle.o:
	g++ -c VisitantePrecioDetalle.cpp

Equipo.o: 
	g++ -c Equipo.cpp

Disco.o:
	g++ -c Disco.cpp

Bus.o:
	g++ -c Bus.cpp

Tarjeta.o:
	g++ -c Tarjeta.cpp