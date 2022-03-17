#ifndef __Bus_h__
#define __Bus_h__
#include "ComponenteEquipo.h"
#include "VisitanteEquipo.h"
#include <string>

using namespace std;

class Bus : public ComponenteEquipo {
	private:
	double precio;
	string nombre;

	public: 
		Bus():precio(120), nombre("Un bus"){}
		Bus(double precio, string nombre):precio(precio), nombre(nombre){}
		void aceptar(VisitanteEquipo *V);
		double getPrecio();
		string getNombre();
};

#endif
