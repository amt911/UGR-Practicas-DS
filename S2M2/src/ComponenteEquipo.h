#include <exception>
using namespace std;

#ifndef __ComponenteEquipo_h__
#define __ComponenteEquipo_h__

// #include "Main.h"
#include "VisitanteEquipo.h"

namespace S2M2
{
	class Main;
	class VisitanteEquipo;
	class ComponenteEquipo;
}

namespace S2M2
{
	__abstract class ComponenteEquipo
	{
		public: S2M2::Main* _unnamed_Main_;

		public: virtual void aceptar(S2M2::VisitanteEquipo aVe) = 0;
	};
}

#endif
