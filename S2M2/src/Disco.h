#include <exception>
using namespace std;

#ifndef __Disco_h__
#define __Disco_h__

#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"

namespace S2M2
{
	class VisitanteEquipo;
	// class ComponenteEquipo;
	class Disco;
}

namespace S2M2
{
	class Disco: public S2M2::ComponenteEquipo
	{

		public: void aceptar(S2M2::VisitanteEquipo aVe);
	};
}

#endif
