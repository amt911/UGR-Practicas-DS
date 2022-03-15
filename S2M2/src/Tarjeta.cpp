using namespace std;

#include "Tarjeta.h"
#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"
#include <string>

Tarjeta(double p,string n): precioTarjeta(p),nombre(n){}

void Tarjeta::aceptar(VisitanteEquipo V) {
	v->visitarTarjeta(this);
}

double Tarjeta::getPrecio(){
	return precioTarjeta;
}

string Tarjeta::getPrecio(){
	return nombre;
}


