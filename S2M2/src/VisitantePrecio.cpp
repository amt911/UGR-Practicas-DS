#include "VisitantePrecio.h"

using namespace std;

VisitantePrecio::VisitantePrecio(){
	precioTotal = 0;
}
void VisitantePrecio::visitarDisco(Disco* aD) {
	precioTotal+=(aD->getPrecio()-(aD->getPrecio()*descuento));
}

void VisitantePrecio::visitarTarjeta(Tarjeta *aT) {
	precioTotal+=(aT->getPrecio()-(aT->getPrecio()*descuento));

}

void VisitantePrecio::visitarBus(Bus * aB) {
	precioTotal+=(aB->getPrecio()-(aB->getPrecio()*descuento));
}

void VisitantePrecio::restablecerPrecio(){
	precioTotal = 0;	
}

int VisitantePrecio::getPrecioTotal(){
	return precioTotal;
}