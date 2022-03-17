#include "Tarjeta.h"

#include <string>

Tarjeta::Tarjeta(double p,string n): precio(p),nombre(n){}

void Tarjeta::aceptar(VisitanteEquipo *V) {
	V->visitarTarjeta(this);
}

double Tarjeta::getPrecio(){
	return precio;
}

string Tarjeta::getNombre(){
	return nombre;
}


