#include <exception>
using namespace std;

#ifndef __Bus_h__
#define __Bus_h__

#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"

namespace S2M2
{
	class VisitanteEquipo;
	// class ComponenteEquipo;
	class Bus;
}

namespace S2M2
{
	class Bus: public S2M2::ComponenteEquipo
	{

		public: void() aceptar(S2M2::VisitanteEquipo aVe);
	};
}

#endif
