

all: salida

salida: main.o VisitantePrecio.o VisitantePrecioDetalle.o Equipo.o Disco.o Bus.o Tarjeta.o
	g++ -o $@ $^


main.o:
	g++ -g -c main.cpp

VisitantePrecio.o:
	g++ -g -c VisitantePrecio.cpp

VisitantePrecioDetalle.o:
	g++ -g -c VisitantePrecioDetalle.cpp

Equipo.o: 
	g++ -g -c Equipo.cpp

Disco.o:
	g++ -g -c Disco.cpp

Bus.o:
	g++ -g -c Bus.cpp

Tarjeta.o:
	g++ -g -c Tarjeta.cpp

clean:
	rm *.o salida vgcore*