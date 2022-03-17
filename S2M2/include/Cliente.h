#ifndef __Cliente_h__
#define __ComponenteCliente_h__

#include <string>

using namespace std;

class Cliente
{
private:
    float descuento;

public:
    Cliente(string tipo);
    float getDescuento();
};
#endif