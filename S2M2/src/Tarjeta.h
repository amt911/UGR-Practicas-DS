using namespace std;

#ifndef __Tarjeta_h__
#define __Tarjeta_h__

#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"
#include <string>

	class Tarjeta : public ComponenteEquipo
	{
		private:
			double precioTarjeta;
			string nombre;

		public:
			Tarjeta(double p,string n);
			void aceptar(VisitanteEquipo V);

			double getPrecio();
			string getNombre();


	};

#endif
