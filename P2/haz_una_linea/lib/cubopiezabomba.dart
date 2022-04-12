import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/cubopieza.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/tablero.dart';

class CuboPiezaBomba extends CuboPieza {
  CuboPiezaBomba() {
    bomba = true;
    int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0] = Bloque(centro - 1, -1, Color.fromARGB(255, 154, 142, 32));
    bloques[1] = Bloque(centro + 0, -1, Color.fromARGB(255, 154, 142, 32));
    bloques[2] = Bloque(centro - 1, -2, Color.fromARGB(255, 154, 142, 32));
    bloques[3] = Bloque(centro + 0, -2, Color.fromARGB(255, 154, 142, 32));

    //Comprobar el centro de esta pieza
    centroPieza = Bloque(centro + 0, -1, Color.fromARGB(255, 154, 142, 32));
  }

  @override
  Pieza clone() {
    List<Bloque> newBloques = List.filled(4, Bloque(-1, -1, Colors.black));
    Bloque newCentro = centroPieza.clone();

    for (int i = 0; i < bloques.length; i++) {
      newBloques[i] = bloques[i].clone();
    }

    Pieza resultado = CuboPiezaBomba();

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
}