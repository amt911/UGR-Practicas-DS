import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/piezas/cubopieza.dart';
import 'package:haz_una_linea/piezas/pieza.dart';
import 'package:haz_una_linea/tablero.dart';

class CuboPiezaNormal extends CuboPieza {
  CuboPiezaNormal() {
    int centro = (ParametrosTablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0] = Bloque(centro - 1, -1, Colors.yellow);
    bloques[1] = Bloque(centro + 0, -1, Colors.yellow);
    bloques[2] = Bloque(centro - 1, -2, Colors.yellow);
    bloques[3] = Bloque(centro + 0, -2, Colors.yellow);

    //Comprobar el centro de esta pieza
    centroPieza = Bloque(centro + 0, -1, Colors.yellow);
  }
  @override
  Pieza clone() {
    List<Bloque> newBloques = List.filled(4, Bloque(-1, -1, Colors.black));
    Bloque newCentro = centroPieza.clone();

    for (int i = 0; i < bloques.length; i++) {
      newBloques[i] = bloques[i].clone();
    }

    Pieza resultado = CuboPiezaNormal();

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
}
