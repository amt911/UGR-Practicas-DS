import 'package:flutter/material.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/piezas/bloque.dart';
import 'package:haz_una_linea/piezas/i_pieza.dart';
import 'package:haz_una_linea/piezas/pieza.dart';

class IPiezaNormal extends IPieza {
  IPiezaNormal() : super() {
    int centro = (ParametrosTablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0] = Bloque(centro - 2, -1, Colors.cyan);
    bloques[1] = Bloque(centro - 1, -1, Colors.cyan);
    bloques[2] = Bloque(centro + 0, -1, Colors.cyan);
    bloques[3] = Bloque(centro + 1, -1, Colors.cyan);

    //Comprobar el centro de esta pieza
    //centroPieza = bloques[1];

    centroPieza =
        Bloque((bloques[1].x + bloques[2].x) / 2, /*-2.5*/ -1.5, Colors.black);
  }

  @override
  Pieza clone() {
    List<Bloque> newBloques = List.filled(4, Bloque(-1, -1, Colors.black));
    Bloque newCentro = centroPieza.clone();

    for (int i = 0; i < bloques.length; i++) {
      newBloques[i] = bloques[i].clone();
    }

    Pieza resultado = IPiezaNormal();

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
}
