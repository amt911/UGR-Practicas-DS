import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/tablero.dart';
import 'package:haz_una_linea/spieza.dart';

class SPiezaBomba extends SPieza {
  SPiezaBomba(inverso) : super(inverso) {
    bomba = true;
    if (inverso) {
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0] = Bloque(centro - 1, -1, Color.fromARGB(255, 35, 78, 37));
      bloques[1] = Bloque(centro + 0, -1, Color.fromARGB(255, 35, 78, 37));
      bloques[2] = Bloque(centro + 0, -2, Color.fromARGB(255, 35, 78, 37));
      bloques[3] = Bloque(centro + 1, -2, Color.fromARGB(255, 35, 78, 37));

      //Comprobar el centro de esta pieza
      centroPieza = Bloque(centro + 0, -1, Color.fromARGB(255, 35, 78, 37));
    } else {
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0] = Bloque(centro - 1, -2, Color.fromARGB(255, 118, 32, 26));
      bloques[1] = Bloque(centro + 0, -2, Color.fromARGB(255, 118, 32, 26));
      bloques[2] = Bloque(centro + 0, -1, Color.fromARGB(255, 118, 32, 26));
      bloques[3] = Bloque(centro + 1, -1, Color.fromARGB(255, 118, 32, 26));

      //Comprobar el centro de esta pieza
      centroPieza = Bloque(centro + 0, -1, Color.fromARGB(255, 118, 32, 26));
    }
  }

  @override
  Pieza clone() {
    List<Bloque> newBloques = List.filled(4, Bloque(-1, -1, Colors.black));
    Bloque newCentro = centroPieza.clone();

    for (int i = 0; i < bloques.length; i++) {
      newBloques[i] = bloques[i].clone();
    }

    Pieza resultado = SPiezaBomba(inverso);

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
}
