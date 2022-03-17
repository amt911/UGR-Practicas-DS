#include <iostream>
//#include "Equipo.h"
//#include "VisitantePrecio.h"
//#include "VisitantePrecioDetalle.h"
#include "Tarjeta.h"
//#include "Bus.h"
//#include "Disco.h"

using namespace std;

int main(){ 
    Tarjeta t1(100, "Tarjeta barata"), t2(1500, "Tarjeta cara");
    //Disco d1(50, "Disco barato"), d2(300, "Disco caro");
    //Bus b1(150, "Bus barato"), b2(500, "Bus caro");
    
    cout <<"Hola funciona pls" <<endl;
    
    //Equipo *e1=new Equipo(&t1, &b1, &d1);
   // Equipo *e2=new Equipo(&t2, &b2, &d2);
    /*
    VisitantePrecio vp;
    VisitantePrecioDetalle vpd;

    e1->aceptar(&vp);
    e1->aceptar(&vpd);

    cout << "Precio total de e1: " << vp.getPrecioTotal();


    e2->aceptar(&vp);
    e2->aceptar(&vpd);
    cout << "Precio total de e2: " << vp.getPrecioTotal();
  */      
    return 0;
}