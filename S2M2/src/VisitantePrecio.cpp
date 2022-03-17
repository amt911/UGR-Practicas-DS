#include "VisitantePrecio.h"

using namespace std;

VisitantePrecio::VisitantePrecio(){
	precioTotal = 0;
}

void VisitantePrecio::visitarDisco(Disco* aD) {
	precioTotal+=aD->getPrecio();
}

void VisitantePrecio::visitarTarjeta(Tarjeta *aT) {
	precioTotal+=aT->getPrecio();

}

void VisitantePrecio::visitarBus(Bus * aB) {
	precioTotal+=aB->getPrecio();
}

int VisitantePrecio::getPrecioTotal(){
	return precioTotal;
}