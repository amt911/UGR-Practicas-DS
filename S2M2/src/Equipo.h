#ifndef __Equipo_h__
#define __Equipo_h__
#include "VisitanteEquipo.h"
#include "ComponenteEquipo.h"
class VisitanteEquipo;
class ComponenteEquipo;

class Equipo{
    private:
        int precio;
        string nombre;
        ComponenteEquipo *componentes[3];

    public:
        Equipo();
        Equipo(ComponenteEquipo *uno, ComponenteEquipo *dos, ComponenteEquipo *tres);
        void aceptar(VisitanteEquipo *eq);
};

#endif