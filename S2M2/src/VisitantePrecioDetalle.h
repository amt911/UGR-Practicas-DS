#include <exception>
using namespace std;

#ifndef __VisitantePrecioDetalle_h__
#define __VisitantePrecioDetalle_h__

#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"
#include "VisitanteEquipo.h"

namespace S2M2
{
	class Disco;
	class Tarjeta;
	class Bus;
	// class VisitanteEquipo;
	class VisitantePrecioDetalle;
}

namespace S2M2
{
	class VisitantePrecioDetalle: public S2M2::VisitanteEquipo
	{

		public: void visitarDisco(S2M2::Disco aD);

		public: void visitarTarjeta(S2M2::Tarjeta aT);

		public: void visitarBus(S2M2::Bus aB);
	};
}

#endif
