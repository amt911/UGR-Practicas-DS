#ifndef __Tarjeta_h__
#define __Tarjeta_h__
#include <string>
#include "ComponenteEquipo.h"
#include "VisitanteEquipo.h"

using namespace std;

class Tarjeta : public ComponenteEquipo {
	private:
	double precio;
	string nombre;
	
	public:
		Tarjeta():precio(1000), nombre("GPU"){}
		Tarjeta(double precio,string nombre);
		void aceptar(VisitanteEquipo *V);
		double getPrecio();
		string getNombre();
};

#endif
