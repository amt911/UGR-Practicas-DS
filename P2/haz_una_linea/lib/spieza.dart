import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/tablero.dart';

abstract class SPieza extends Pieza {
  bool inverso;

  SPieza(this.inverso);
  @override
  void resetPosicion() {
    if (inverso) {
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0].setXY(centro - 1, -1);
      bloques[1].setXY(centro + 0, -1);
      bloques[2].setXY(centro + 0, -2);
      bloques[3].setXY(centro + 1, -2);

      //Comprobar el centro de esta pieza
      centroPieza.setXY(centro + 0, -1);
    } else {
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0].setXY(centro - 1, -2);
      bloques[1].setXY(centro + 0, -2);
      bloques[2].setXY(centro + 0, -1);
      bloques[3].setXY(centro + 1, -1);

      //Comprobar el centro de esta pieza
      centroPieza.setXY(centro + 0, -1);
    }
  }
}
