#include "Disco.h"
#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"

Disco::Disco(double p,string n): precio(p),nombre(n){}

void Disco::aceptar(VisitanteEquipo V){
	V.visitarDisco(*this);
}

double Disco::getPrecio(){
	return precio;
}

string Disco::getNombre(){
	return nombre;
}

