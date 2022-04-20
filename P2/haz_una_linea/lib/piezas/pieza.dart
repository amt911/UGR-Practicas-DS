import 'package:flutter/material.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/piezas/bloque.dart';
import 'package:haz_una_linea/piezas/movimientos.dart';

abstract class Pieza {
  late List<Bloque> bloques; //Una pieza es un conjunto de bloques
  late Bloque centroPieza; //Sirve para luego poder rotar la pieza
  //late bool bomba = false;
  void resetPosicion();

  Pieza() {
    bloques = List.filled(4, Bloque(0, 0, Colors.black), growable: true);
    centroPieza = bloques[0];
  }

  Pieza clone();

  //bool esbomba() {
  //  return bomba;
  //}

  void explotar(List<List<Bloque?>> bloquesPuestos) {}

  void mover(Movimientos mov) {
    switch (mov) {
      case Movimientos.IZQUIERDA: //Izquierda
        if (!colisionLateral(true)) {
          for (Bloque element in bloques) {
            element.x -= 1;
          }
          centroPieza.x -= 1;
        }
        break;

      case Movimientos.DERECHA: //Derecha
        if (!colisionLateral(false)) {
          for (Bloque element in bloques) {
            element.x += 1;
          }
          centroPieza.x += 1;
        }
        break;

      case Movimientos.BAJAR: //Abajo
        for (Bloque element in bloques) {
          element.y += 1;
        }
        centroPieza.y += 1;
        break;

      default:
        break;
    }
  }

  bool colisionLateral(bool esIzquierda) {
    bool res = false;

    //Permite comprobar solo la parte izquierda o derecha
    if (esIzquierda) {
      for (Bloque aux in bloques) {
        if (aux.x <= 0) res = true;
      }
    } else {
      for (Bloque aux in bloques) {
        if (aux.x >= (ParametrosTablero.TABLERO_WIDTH_PIEZAS - 1)) res = true;
      }
    }

    return res;
  }

  bool colisionLateralGiro() {
    //Este tipo de colision permite girar justo pegado a la pared
    bool res = false;

    for (Bloque aux in bloques) {
      if (aux.x < 0 || aux.x > (ParametrosTablero.TABLERO_WIDTH_PIEZAS - 1)) {
        res = true;
      }
    }

    return res;
  }

  void girar(Movimientos mov) {
    //Formulas obtenidas de la asignatura IG
    if (mov == Movimientos.GIRAR_DCHA) {
      //Giros a la derecha
      for (Bloque element in bloques) {
        double x = element.x;
        element.x = centroPieza.x + centroPieza.y - element.y;
        element.y = centroPieza.y + x - centroPieza.x;
      }

      //Si al girar se colisiona se pone de nuevo como estaba
      if (colisionLateralGiro()) {
        for (Bloque element in bloques) {
          double x = element.x;
          element.x = centroPieza.x - centroPieza.y + element.y;
          element.y = centroPieza.y - x + centroPieza.x;
        }
      }
    } else {
      for (Bloque element in bloques) {
        double x = element.x;
        element.x = centroPieza.x - centroPieza.y + element.y;
        element.y = centroPieza.y - x + centroPieza.x;
      }

      //Si al girar se colisiona se pone de nuevo como estaba
      if (colisionLateralGiro()) {
        for (Bloque element in bloques) {
          double x = element.x;
          element.x = centroPieza.x + centroPieza.y - element.y;
          element.y = centroPieza.y + x - centroPieza.x;
        }
      }
    }
  }

  bool estaEnSuelo() {
    bool res = false;

    for (Bloque aux in bloques) {
      if (aux.y >= (ParametrosTablero.TABLERO_HEIGHT_PIEZAS - 1)) res = true;
    }

    return res;
  }

  bool estaEncimaPieza(List<List<Bloque?>> bloquesPuestos) {
    bool res = false;
    for (Bloque aux in bloques) {
      //Solamente se comprueba si el bloque se encuentra dentro del tablero
      if ((aux.y >= 0 && aux.y < ParametrosTablero.TABLERO_HEIGHT_PIEZAS) &&
          bloquesPuestos[(aux.y + 1).toInt()][aux.x.toInt()] != null) {
        res = true;
      }
    }

    return res;
  }

  bool colisionLateralPieza(
      bool esIzquierda, List<List<Bloque?>> bloquesPuestos) {
    bool res = false;

    if (esIzquierda) {
      for (Bloque aux in bloques) {
        if ((aux.x > 0) &&
            (aux.y >= 0) &&
            (bloquesPuestos[aux.y.toInt()][(aux.x - 1).toInt()] != null)) {
          res = true;
        }
      }
    } else {
      for (Bloque aux in bloques) {
        if ((aux.x < (ParametrosTablero.TABLERO_WIDTH_PIEZAS - 1)) &&
            (aux.y >= 0) &&
            (bloquesPuestos[aux.y.toInt()][(aux.x + 1).toInt()] != null)) {
          res = true;
        }
      }
    }

    return res;
  }

  bool giroChoque(Movimientos mov, List<List<Bloque?>> bloquesPuestos) {
    Pieza bloqueAux = clone(); //Para no modificar la pieza actual
    bloqueAux.girar(
        mov); //Se gira (incluye las restricciones laterales) para comprobar si se solapan
    bool res = false;

    for (Bloque aux in bloqueAux.bloques) {
      if ((aux.y >= 0 && aux.y < ParametrosTablero.TABLERO_HEIGHT_PIEZAS) &&
          bloquesPuestos[aux.y.toInt()][aux.x.toInt()] != null) {
        res = true;
      }
    }

    return res;
  }
}
