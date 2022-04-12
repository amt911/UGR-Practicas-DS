import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/ipieza.dart';
import 'package:haz_una_linea/lpieza.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/tablero.dart';

class LPiezaNormal extends LPieza {
  LPiezaNormal(inverso) : super(inverso) {
    if (inverso) {
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0] = Bloque(centro - 1, -1, Colors.orange);
      bloques[1] = Bloque(centro + 0, -1, Colors.orange);
      bloques[2] = Bloque(centro + 1, -1, Colors.orange);

      //Comprobar el centro de esta pieza
      centroPieza = Bloque(centro + 0, -1, Colors.orange);
    } else {
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0] = Bloque(centro - 1, -2, Colors.blue);
      bloques[1] = Bloque(centro + 0, -2, Colors.blue);
      bloques[2] = Bloque(centro + 1, -2, Colors.blue);
      bloques[3] = Bloque(centro + 1, -1, Colors.blue);

      //Comprobar el centro de esta pieza
      centroPieza = Bloque(centro + 0, -2, Colors.blue);
    }
  }
  @override
  Pieza clone() {
    List<Bloque> newBloques = List.filled(4, Bloque(-1, -1, Colors.black));
    Bloque newCentro = centroPieza.clone();

    for (int i = 0; i < bloques.length; i++) {
      newBloques[i] = bloques[i].clone();
    }

    Pieza resultado = LPiezaNormal(inverso);

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
}
