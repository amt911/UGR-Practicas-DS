#include <exception>
using namespace std;

#ifndef __VisitanteEquipo_h__
#define __VisitanteEquipo_h__

// #include "Main.h"
#include "Disco.h"
#include "Tarjeta.h"
#include "Bus.h"

namespace S2M2
{
	class Main;
	class Disco;
	class Tarjeta;
	class Bus;
	class VisitanteEquipo;
}

namespace S2M2
{
	__abstract class VisitanteEquipo
	{
		public: S2M2::Main* _unnamed_Main_;

		public: virtual void visitarDisco(S2M2::Disco aD) = 0;

		public: virtual void visitarTarjeta(S2M2::Tarjeta aT) = 0;

		public: virtual void visitarBus(S2M2::Bus aB) = 0;
	};
}

#endif
