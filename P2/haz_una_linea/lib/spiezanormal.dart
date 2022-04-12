import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/tablero.dart';
import 'package:haz_una_linea/spieza.dart';

class SPiezaNormal extends SPieza {
  SPiezaNormal(inverso) : super(inverso) {
    if (inverso) {
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0] = Bloque(centro - 1, -1, Colors.green);
      bloques[1] = Bloque(centro + 0, -1, Colors.green);
      bloques[2] = Bloque(centro + 0, -2, Colors.green);
      bloques[3] = Bloque(centro + 1, -2, Colors.green);

      //Comprobar el centro de esta pieza
      centroPieza = Bloque(centro + 0, -1, Colors.green);
    } else {
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0] = Bloque(centro - 1, -2, Colors.red);
      bloques[1] = Bloque(centro + 0, -2, Colors.red);
      bloques[2] = Bloque(centro + 0, -1, Colors.red);
      bloques[3] = Bloque(centro + 1, -1, Colors.red);

      //Comprobar el centro de esta pieza
      centroPieza = Bloque(centro + 0, -1, Colors.red);
    }
  }

  @override
  Pieza clone() {
    List<Bloque> newBloques = List.filled(4, Bloque(-1, -1, Colors.black));
    Bloque newCentro = centroPieza.clone();

    for (int i = 0; i < bloques.length; i++) {
      newBloques[i] = bloques[i].clone();
    }

    Pieza resultado = SPiezaNormal(inverso);

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
}
