using namespace std;

#include "Disco.h"
#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"
#include <string>

Disco(double p,string n): precioDisco(p),nombre(n){}

void Disco::aceptar(VisitanteEquipo V) override {
	v->visitarDisco(this);
}

double Disco::getPrecio(){
	return precioDisco;
}

string Disco::getPrecio(){
	return nombre;
}

