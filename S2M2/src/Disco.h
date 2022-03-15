using namespace std;

#ifndef __Disco_h__
#define __Disco_h__

#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"

class Disco: public ComponenteEquipo
{

	private:
			double precioDisco;
			string nombre;

		public:
			Disco(double p,string n);
			void aceptar(VisitanteEquipo V) override;

			double getPrecio();
			string getNombre();
};

#endif