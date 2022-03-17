#ifndef __ComponenteEquipo_h__
#define __ComponenteEquipo_h__

class VisitanteEquipo;

class ComponenteEquipo
{
	public:
	virtual void aceptar(VisitanteEquipo *V)=0;
};
#endif