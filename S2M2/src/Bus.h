#include <exception>
using namespace std;

#ifndef __Bus_h__
#define __Bus_h__

#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"

class Bus: public ComponenteEquipo
{
	public: 
	void aceptar(VisitanteEquipo aVe);
};

#endif
