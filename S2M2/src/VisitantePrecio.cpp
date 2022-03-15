using namespace std;

#include "VisitantePrecio.h"
#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"
#include "VisitanteEquipo.h"

VisitantePrecio::VisitantePrecio(){
	precioTotal = 0;
}

void VisitantePrecio::visitarDisco(Disco aD) {
	precioTotal+=aD.getDiscoPrecio();
}

void VisitantePrecio::visitarTarjeta(Tarjeta aT) {
	precioTotal+=aT.getTarjetaPrecio();

}

void VisitantePrecio::visitarBus(Bus aB) {
	precioTotal+=aB.getBusPrecio();
}

int getPrecioTotal(){
	return precioTotal;
}