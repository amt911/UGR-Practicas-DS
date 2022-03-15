#include <exception>
using namespace std;

#ifndef __VisitanteEquipo_h__
#define __VisitanteEquipo_h__

#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"

class VisitanteEquipo{
	public: 
		virtual void visitarDisco(Disco aD);
		virtual void visitarTarjeta(Tarjeta aT);
		virtual void visitarBus(Bus aB);
		virtual void visitarEquipo(Equipo e);
};

#endif
