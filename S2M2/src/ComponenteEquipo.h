#include <exception>
using namespace std;

#ifndef __ComponenteEquipo_h__
#define __ComponenteEquipo_h__

// #include "Main.h"
#include "VisitanteEquipo.h"
	class ComponenteEquipo
	{
		public:
		virtual void aceptar(VisitanteEquipo aVe) = 0;
	};


#endif
