#include <exception>
using namespace std;

#ifndef __Disco_h__
#define __Disco_h__

#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"

class Disco: public ComponenteEquipo
{

	public: void aceptar(VisitanteEquipo aVe);
};

#endif