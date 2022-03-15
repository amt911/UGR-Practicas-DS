#ifndef EQUIPO_H
#define EQUIPO_H
#include "ComponenteEquipo.h"
#include "VisitanteEquipo.h"

class Equipo{
    private:
        int precio;
        string nombre;

        ComponenteEquipo componentes[3];

    public:
        Equipo();
        Equipo(ComponenteEquipo uno, ComponenteEquipo dos, ComponenteEquipo tres);
        void aceptar(VisitanteEquipo eq);
};

#endif