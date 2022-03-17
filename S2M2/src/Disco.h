#ifndef __Disco_h__
#define __Disco_h__
#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"
#include <string>

using namespace std;

class Disco : public ComponenteEquipo{
	private:
		double precio;
		string nombre;

	public:
		Disco(): precio(100), nombre("Disco duro"){}
		Disco(double precio,string nombre);
		void aceptar(VisitanteEquipo *V);
		double getPrecio();
		string getNombre();
};

#endif