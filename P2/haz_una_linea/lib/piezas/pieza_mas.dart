import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/piezas/pieza.dart';

abstract class PiezaMas extends Pieza {
  PiezaMas();

  @override
  void resetPosicion() {
    int centro = (ParametrosTablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0].setXY(centro - 1, -2);
    bloques[1].setXY(centro + 0, -2);
    bloques[2].setXY(centro + 1, -2);
    bloques[3].setXY(centro + 0, -3);
    bloques[4].setXY(centro + 0, -1);

    //Comprobar el centro de esta pieza
    centroPieza.setXY(centro + 0, -2);
  }
}
