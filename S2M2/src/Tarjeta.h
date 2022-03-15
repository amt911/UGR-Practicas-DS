#ifndef __Tarjeta_h__
#define __Tarjeta_h__


#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"
#include <string>

class Tarjeta: public ComponenteEquipo
{
	private:
	int precio;
	string nombre;
	
	public:
		Tarjeta():precio(1000), nombre("GPU"){}
		Tarjeta(double p,string n);
		void aceptar(VisitanteEquipo V) override;
		double getPrecio();
		string getNombre();
};

#endif
