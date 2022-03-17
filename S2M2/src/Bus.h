#ifndef __Bus_h__
#define __Bus_h__
#include "ComponenteEquipo.h"
#include <string>

using namespace std;

class VisitanteEquipo;

class Bus: public ComponenteEquipo
{
	private:
	int precio;
	string nombre;

	public: 
	Bus():precio(120), nombre("Un bus"){}
	Bus(int precio, string nombre):precio(precio), nombre(nombre){}
	
	void aceptar(VisitanteEquipo *V);
	int getPrecio();
	string getNombre();
};

#endif
