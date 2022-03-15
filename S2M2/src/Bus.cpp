#include <exception>
using namespace std;

#include "Bus.h"
#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"

void Bus::aceptar(VisitanteEquipo aVe) {
	aVe.visitarBus(*this);

}

int Bus::getBusPrecio(){
	return precio;
}

string Bus::getBusNombre(){
	return nombre;
}