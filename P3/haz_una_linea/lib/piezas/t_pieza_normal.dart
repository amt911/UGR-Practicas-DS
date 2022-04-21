import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/piezas/pieza.dart';
import 'package:haz_una_linea/piezas/t_pieza.dart';

class TPiezaNormal extends TPieza {
  TPiezaNormal() {
    int centro = (ParametrosTablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0] = Bloque(centro - 1, -1, Colors.purple);
    bloques[1] = Bloque(centro + 0, -1, Colors.purple);
    bloques[2] = Bloque(centro + 1, -1, Colors.purple);
    bloques[3] = Bloque(centro + 0, -2, Colors.purple);

    //Comprobar el centro de esta pieza
    centroPieza = Bloque(centro + 0, -1, Colors.white);

    //if (identical(centroPieza, bloques[1])) print("SON IGUALES EN CONSTRUCTOR\n");
  }

  @override
  Pieza clone() {
    List<Bloque> newBloques = List.filled(4, Bloque(-1, -1, Colors.black));
    Bloque newCentro = centroPieza.clone();

    for (int i = 0; i < bloques.length; i++) {
      newBloques[i] = bloques[i].clone();
    }

    Pieza resultado = TPiezaNormal();

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
}
