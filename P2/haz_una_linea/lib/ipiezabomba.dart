import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/ipieza.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/tablero.dart';

class IPiezaBomba extends IPieza {
  IPiezaBomba() : super() {
    int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0] = Bloque(centro - 2, -1, Color.fromARGB(255, 0, 55, 62));
    bloques[1] = Bloque(centro - 1, -1, Color.fromARGB(255, 0, 55, 62));
    bloques[2] = Bloque(centro + 0, -1, Color.fromARGB(255, 0, 55, 62));
    bloques[3] = Bloque(centro + 1, -1, Color.fromARGB(255, 0, 55, 62));

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

    Pieza resultado = IPiezaBomba();

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
}
