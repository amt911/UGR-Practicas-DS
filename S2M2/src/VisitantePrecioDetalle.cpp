#include <iostream>
#include "VisitantePrecioDetalle.h"

using namespace std;

void VisitantePrecioDetalle::visitarDisco(Disco *aD){
	cout << "El producto " << aD->getNombre() << " cuesta " << (aD->getPrecio()-aD->getPrecio()*descuento) << endl;
}

void VisitantePrecioDetalle::visitarTarjeta(Tarjeta *aT){
	cout << "El producto " << aT->getNombre() << " cuesta " << (aT->getPrecio()-aT->getPrecio()*descuento) << endl;
}

void VisitantePrecioDetalle::visitarBus(Bus * aB){
	cout << "El producto " << aB->getNombre() << " cuesta " << (aB->getPrecio()-aB->getPrecio()*descuento) << endl;
}