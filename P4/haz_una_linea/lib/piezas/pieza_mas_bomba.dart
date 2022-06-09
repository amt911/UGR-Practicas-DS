import 'package:flutter/material.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/piezas/bloque.dart';
import 'package:haz_una_linea/piezas/pieza.dart';
import 'package:haz_una_linea/piezas/pieza_mas.dart';

class PiezaMasBomba extends PiezaMas{
  PiezaMasBomba() {
    int centro = (ParametrosTablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0] = Bloque(centro - 1, -2, const Color.fromARGB(255, 100, 13, 42));
    bloques[1] = Bloque(centro + 0, -2, const Color.fromARGB(255, 100, 13, 42));
    bloques[2] = Bloque(centro + 1, -2, const Color.fromARGB(255, 100, 13, 42));
    bloques[3] = Bloque(centro + 0, -3, const Color.fromARGB(255, 100, 13, 42));
    bloques.add(Bloque(centro + 0, -1, const Color.fromARGB(255, 100, 13, 42)));

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

    Pieza resultado = PiezaMasBomba();

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