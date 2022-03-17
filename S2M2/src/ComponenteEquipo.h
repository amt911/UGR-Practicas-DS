#ifndef __ComponenteEquipo_h__
#define __ComponenteEquipo_h__
#include "VisitanteEquipo.h"
class VisitanteEquipo;

class ComponenteEquipo
{
	public:
	virtual void aceptar(VisitanteEquipo *V)=0;
};
#endif