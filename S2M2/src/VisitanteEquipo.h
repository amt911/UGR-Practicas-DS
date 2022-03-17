#ifndef __VisitanteEquipo_h__
#define __VisitanteEquipo_h__

class Disco;
class Tarjeta;
class Bus;
class Equipo;


class VisitanteEquipo{
	public:
		virtual void visitarDisco(Disco * aD)=0;
		virtual void visitarTarjeta(Tarjeta * aT)=0;
		virtual void visitarBus(Bus * aB)=0;
		virtual void visitarEquipo(Equipo * e)=0;
};

#endif
