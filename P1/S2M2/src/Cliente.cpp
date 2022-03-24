#include "Cliente.h"
    Cliente::Cliente(TipoCliente tipo)
    {
        if (tipo == TipoCliente::Comun)
        {
            descuento = 0;
        }
        else if (tipo == TipoCliente::Estudiante)
        {
            descuento = 0.1;
        }
        else if (tipo == TipoCliente::Mayorista)
        {
            descuento = 0.15;
        }
    }

float Cliente::getDescuento(){
    return descuento;
}