#include <exception>
using namespace std;

#ifndef __VisitantePrecio_h__
#define __VisitantePrecio_h__

#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"
#include "VisitanteEquipo.h"
class VisitantePrecio: public VisitanteEquipo
{
	public:

	void visitarDisco(Disco aD);
	void visitarTarjeta(Tarjeta aT);
	void visitarBus(Bus aB);
};

#endif
