#ifndef __Disco_h__
#define __Disco_h__

#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"
#include <string>

using namespace std;

class Disco: public ComponenteEquipo
{
	private:
	int precio;
	string nombre;

	public:
	Disco(): precio(100), nombre("Disco duro"){}
	Disco(int precio, string nombre):precio(precio), nombre(nombre){}
	void aceptar(VisitanteEquipo aVe);
	void operacionDisco();
};

#endif