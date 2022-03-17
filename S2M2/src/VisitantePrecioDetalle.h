#ifndef __VisitantePrecioDetalle_h__
#define __VisitantePrecioDetalle_h__
#include "VisitanteEquipo.h"
#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"
#include "Equipo.h"
class VisitantePrecioDetalle : public VisitanteEquipo
{
	public:
	void visitarDisco(Disco * aD) override;
	void visitarTarjeta(Tarjeta * aT) override;
	void visitarBus(Bus * aB) override;
	void visitarEquipo(Equipo * e) override{}
};


#endif
