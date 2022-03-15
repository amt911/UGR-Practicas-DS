#include "Equipo.h"

void Equipo::aceptar(VisitanteEquipo ve){
    for(int i=0; i<3; i++)
        componentes[i].aceptar(ve);

    ve.visitarEquipo(*this);
}

Equipo::Equipo(){}

Equipo::Equipo(ComponenteEquipo uno, ComponenteEquipo dos, ComponenteEquipo tres){
    componentes[0]=uno;
    componentes[1]=dos;
    componentes[2]=tres;
}