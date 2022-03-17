#ifndef __Disco_h__
#define __Disco_h__
#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"
#include <string>

using namespace std;

class VisitanteEquipo;

class Disco: public ComponenteEquipo{
	private:
		int precio;
		string nombre;

	public:
		Disco(): precio(100), nombre("Disco duro"){}
		Disco(double p,string n);
		void aceptar(VisitanteEquipo *V);
		double getPrecio();
		string getNombre();
};

#endif