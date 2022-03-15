
#include <iostream>

#include "VisitantePrecioDetalle.h"
#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"
#include "VisitanteEquipo.h"

using namespace std;

void VisitantePrecioDetalle::visitarDisco(Disco aD) {
	cout << "El producto " << aD.getNombre() << " cuesta " << aD.getPrecio() << endl;
}

void VisitantePrecioDetalle::visitarTarjeta(Tarjeta aT) {
	cout << "El producto " << aT.getNombre() << " cuesta " << aT.getPrecio() << endl;
}

void VisitantePrecioDetalle::visitarBus(Bus aB) {
	cout << "El producto " << aB.getNombre() << " cuesta " << aB.getPrecio() << endl;
}


