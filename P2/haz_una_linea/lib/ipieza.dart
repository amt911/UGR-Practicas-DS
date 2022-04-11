import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/tablero.dart';

class IPieza extends Pieza {
  IPieza() : super() {
    int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0] = Bloque(centro - 2, -1, Colors.cyan);
    bloques[1] = Bloque(centro - 1, -1, Colors.cyan);
    bloques[2] = Bloque(centro + 0, -1, Colors.cyan);
    bloques[3] = Bloque(centro + 1, -1, Colors.cyan);

    //Comprobar el centro de esta pieza
    //centroPieza = bloques[1];

    centroPieza = Bloque((bloques[1].x + bloques[2].x) / 2, /*-2.5*/ -2.5, Colors.black);
  }

  @override
  Pieza clone() {
    List<Bloque> newBloques = List.filled(4, Bloque(-1, -1, Colors.black));
    Bloque newCentro = centroPieza.clone();

    for (int i = 0; i < bloques.length; i++) {
      newBloques[i] = bloques[i].clone();
    }

    Pieza resultado = IPieza();

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
/*
  @override
  void mover(int direccion){
    super.mover(direccion);

    switch (direccion) {
      case 1: //Izquierda
      if(!colisionLateral(true)) {
        centroPieza.x -= 1;
      }
        break;

      case 2: //Derecha
      if(!colisionLateral(false)) {
        centroPieza.x += 1;
      }
        break;

      case 3: //Abajo
        centroPieza.y += 1;
        break;
    }
  }*/
}
