#include <exception>
using namespace std;

#ifndef __Tarjeta_h__
#define __Tarjeta_h__

#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"

namespace S2M2
{
	class VisitanteEquipo;
	// class ComponenteEquipo;
	class Tarjeta;
}

namespace S2M2
{
	class Tarjeta: public S2M2::ComponenteEquipo
	{

		public: void() aceptar(S2M2::VisitanteEquipo aVe);
	};
}

#endif
