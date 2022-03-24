#ifndef __Cliente_h__
#define __ComponenteCliente_h__

#include <string>
#include <TipoCliente.h>
using namespace std;

class Cliente
{
private:
    float descuento;

public:
    Cliente(TipoCliente tipo);
    float getDescuento();
};
#endif