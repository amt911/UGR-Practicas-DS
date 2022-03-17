#ifndef __Tarjeta_h__
#define __Tarjeta_h__

#include <string>

using namespace std;

class VisitanteEquipo;

class Tarjeta: public ComponenteEquipo
{
	private:
	int precio;
	string nombre;
	
	public:
		Tarjeta():precio(1000), nombre("GPU"){}
		Tarjeta(double p,string n);
		void aceptar(VisitanteEquipo *V);
		double getPrecio();
		string getNombre();
};

#endif
