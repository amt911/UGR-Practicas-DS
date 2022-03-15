#include <exception>
using namespace std;

#ifndef __Tarjeta_h__
#define __Tarjeta_h__

#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"

class Tarjeta
{
	private:
	int precio;
	string nombre;
	public:
		Tarjeta():precio(1000), nombre("GPU"){}
		Tarjeta(int precio, string nombre):precio(precio), nombre(nombre){}
		void aceptar(VisitanteEquipo aVe);
		void operacionTarjeta();
};

#endif
