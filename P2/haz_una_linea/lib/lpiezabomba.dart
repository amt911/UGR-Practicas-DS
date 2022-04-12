import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/ipieza.dart';
import 'package:haz_una_linea/lpieza.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/tablero.dart';

class LPiezaBomba extends LPieza {
  LPiezaBomba(inverso) : super(inverso) {
    bomba = true;

    if (inverso) {
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0] = Bloque(centro - 1, -1, Color.fromARGB(255, 133, 80, 0));
      bloques[1] = Bloque(centro + 0, -1, Color.fromARGB(255, 133, 80, 0));
      bloques[2] = Bloque(centro + 1, -1, Color.fromARGB(255, 133, 80, 0));
      bloques[3] = Bloque(centro + 1, -2, Color.fromARGB(255, 133, 80, 0));

      //Comprobar el centro de esta pieza
      centroPieza = Bloque(centro + 0, -1, Color.fromARGB(255, 133, 80, 0));
    } else {
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0] = Bloque(centro - 1, -2, Color.fromARGB(255, 12, 58, 95));
      bloques[1] = Bloque(centro + 0, -2, Color.fromARGB(255, 12, 58, 95));
      bloques[2] = Bloque(centro + 1, -2, Color.fromARGB(255, 12, 58, 95));
      bloques[3] = Bloque(centro + 1, -1, Color.fromARGB(255, 12, 58, 95));

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

    Pieza resultado = LPiezaBomba(inverso);

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
}
