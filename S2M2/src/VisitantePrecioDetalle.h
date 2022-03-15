#include <exception>
using namespace std;

#ifndef __VisitantePrecioDetalle_h__
#define __VisitantePrecioDetalle_h__

#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"
#include "VisitanteEquipo.h"
class VisitantePrecioDetalle: public VisitanteEquipo
{
	public:
	void visitarDisco(Disco aD);
	void visitarTarjeta(Tarjeta aT);
	void visitarBus(Bus aB);
};


#endif
