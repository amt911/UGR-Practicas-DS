#include "Bus.h"

void Bus::aceptar(VisitanteEquipo *V) {
	V->visitarBus(this);
}

double Bus::getPrecio(){
	return precio;
}

string Bus::getNombre(){
	return nombre;
}