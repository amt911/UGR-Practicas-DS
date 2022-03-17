#include "Cliente.h"
    Cliente::Cliente(string tipo)
    {
        if (tipo == "comun")
        {
            descuento = 0;
        }
        else if (tipo == "estudiante")
        {
            descuento = 0.1;
        }
        else if (tipo == "mayorista")
        {
            descuento = 0.15;
        }
    }

float Cliente::getDescuento(){
    return descuento;
}