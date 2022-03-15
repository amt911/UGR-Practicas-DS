#include <exception>
using namespace std;

#ifndef __Tarjeta_h__
#define __Tarjeta_h__

#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"

	class Tarjeta
	{
		public:
			void aceptar(VisitanteEquipo aVe);
	};

#endif
