import 'package:flutter/material.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/piezas/bloque.dart';
import 'package:haz_una_linea/piezas/pieza.dart';
import 'package:haz_una_linea/piezas/pieza_mas.dart';

class PiezaMasNormal extends PiezaMas{
  PiezaMasNormal() {
    int centro = (ParametrosTablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0] = Bloque(centro - 1, -2, Colors.pink);
    bloques[1] = Bloque(centro + 0, -2, Colors.pink);
    bloques[2] = Bloque(centro + 1, -2, Colors.pink);
    bloques[3] = Bloque(centro + 0, -3, Colors.pink);
    bloques.add(Bloque(centro + 0, -1, Colors.pink));

    //Comprobar el centro de esta pieza
    centroPieza = Bloque(centro + 0, -2, Colors.white);
  }

  @override
  Pieza clone() {
    List<Bloque> newBloques = List.filled(5, Bloque(-1, -1, Colors.black));
    Bloque newCentro = centroPieza.clone();

    for (int i = 0; i < bloques.length; i++) {
      newBloques[i] = bloques[i].clone();
    }

    Pieza resultado = PiezaMasNormal();

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
}