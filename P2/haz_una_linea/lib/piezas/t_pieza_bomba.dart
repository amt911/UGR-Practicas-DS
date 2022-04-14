import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/piezas/pieza.dart';
import 'package:haz_una_linea/piezas/t_pieza.dart';

class TPiezaBomba extends TPieza {
  TPiezaBomba() {
    //bomba = true;
    int centro = (ParametrosTablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0] = Bloque(centro - 1, -1, const Color.fromARGB(255, 82, 20, 93));
    bloques[1] = Bloque(centro + 0, -1, const Color.fromARGB(255, 82, 20, 93));
    bloques[2] = Bloque(centro + 1, -1, const Color.fromARGB(255, 82, 20, 93));
    bloques[3] = Bloque(centro + 0, -2, const Color.fromARGB(255, 82, 20, 93));

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

    Pieza resultado = TPiezaBomba();

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }

  @override
  void explotar(List<List<Bloque?>> bloquesPuestos) {
    for (Bloque aux in bloques) {
      if (aux.y.toInt() >= 0) {
        bloquesPuestos[aux.y.toInt()][aux.x.toInt()] = null;
      }
      if (aux.y.toInt() > 0) {
        bloquesPuestos[aux.y.toInt() - 1][aux.x.toInt()] = null;
        if (aux.x.toInt() > 0) {
          bloquesPuestos[aux.y.toInt() - 1][aux.x.toInt() - 1] = null;
        }
        if (aux.x.toInt() < ParametrosTablero.TABLERO_WIDTH_PIEZAS.toInt() - 1) {
          bloquesPuestos[aux.y.toInt() - 1][aux.x.toInt() + 1] = null;
        }
      }
      if (aux.y >= 0 &&
          aux.y.toInt() < ParametrosTablero.TABLERO_HEIGHT_PIEZAS.toInt() - 1) {
        bloquesPuestos[aux.y.toInt() + 1][aux.x.toInt()] = null;
        if (aux.x.toInt() > 0) {
          bloquesPuestos[aux.y.toInt() + 1][aux.x.toInt() - 1] = null;
        }
        if (aux.x.toInt() < ParametrosTablero.TABLERO_WIDTH_PIEZAS.toInt() - 1) {
          bloquesPuestos[aux.y.toInt() + 1][aux.x.toInt() + 1] = null;
        }
      }
      if (aux.y >= 0 && aux.x.toInt() < ParametrosTablero.TABLERO_WIDTH_PIEZAS - 1) {
        bloquesPuestos[aux.y.toInt()][aux.x.toInt() + 1] = null;
      }
      if (aux.y >= 0 && aux.x.toInt() > 0) {
        bloquesPuestos[aux.y.toInt()][aux.x.toInt() - 1] = null;
      }
    }
  }  
}
