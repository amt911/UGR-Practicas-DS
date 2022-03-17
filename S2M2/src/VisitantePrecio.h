#ifndef __VisitantePrecio_h__
#define __VisitantePrecio_h__


#include "VisitanteEquipo.h"
class VisitantePrecio: public VisitanteEquipo
{
	private: 
		int precioTotal;
	
	public:
	VisitantePrecio();
	void visitarDisco(Disco * aD) override;
	void visitarTarjeta(Tarjeta * aT) override;
	void visitarBus(Bus *aB) override;
	int getPrecioTotal();

	void visitarEquipo(Equipo *e) override {}
};

#endif
