#ifndef __VisitanteEquipo_h__
#define __VisitanteEquipo_h__

#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"
#include "Equipo.h"

class Bus;
class Disco;
class Equipo;
class Tarjeta;

class VisitanteEquipo{
	public:
		virtual void visitarDisco(Disco * aD)=0;
		virtual void visitarTarjeta(Tarjeta * aT)=0;
		virtual void visitarBus(Bus * aB)=0;
		virtual void visitarEquipo(Equipo * e)=0;
};

#endif
