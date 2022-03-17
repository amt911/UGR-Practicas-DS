#ifndef __VisitanteEquipo_h__
#define __VisitanteEquipo_h__

#include <Cliente.h>

class Disco;
class Tarjeta;
class Bus;
class Equipo;


class VisitanteEquipo{
	protected: 
		float descuento;

	public:
		virtual void visitarDisco(Disco * aD)=0;
		virtual void visitarTarjeta(Tarjeta * aT)=0;
		virtual void visitarBus(Bus * aB)=0;
		void setDescuento(Cliente c);
};

#endif
