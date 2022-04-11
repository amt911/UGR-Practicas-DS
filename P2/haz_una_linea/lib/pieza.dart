import 'package:flutter/material.dart';
import 'package:haz_una_linea/tablero.dart';

import 'bloque.dart';

abstract class Pieza {
  late List<Bloque> bloques; //Una pieza es un conjunto de bloques
  late Bloque centroPieza; //Sirve para luego poder rotar la pieza

  Pieza() {
    bloques = List.filled(4, Bloque(0, 0, Colors.black));
    centroPieza = bloques[0];
  }

  Pieza clone();

  void mover(int dir) {
    switch (dir) {
      case 1: //Izquierda
        if (!colisionLateral(true)) {
          for (Bloque element in bloques) {
            element.x -= 1;
          }
          centroPieza.x -= 1;
        }
        break;

      case 2: //Derecha
        if (!colisionLateral(false)) {
          for (Bloque element in bloques) {
            element.x += 1;
          }
          centroPieza.x += 1;
        }
        break;

      case 3: //Abajo
        for (Bloque element in bloques) {
          //print("x: ${element.x}, y: ${element.y}\n");
          element.y += 1;
        }
        //print("CENTROPIEZA x: ${centroPieza.x}, y: ${centroPieza.y}\n");
        centroPieza.y += 1;
        break;
    }
  }

  bool colisionLateral(bool esIzquierda) {
    bool res = false;
    if (esIzquierda) {
      for (Bloque aux in bloques) {
        if (aux.x <= 0) res = true;
      }
    } else {
      for (Bloque aux in bloques) {
        if (aux.x >= (Tablero.TABLERO_WIDTH_PIEZAS - 1)) res = true;
      }
    }

    return res;
  }

  bool colisionLateralGiro(bool esIzquierda) {
    //Este tipo de colision permite girar justo pegado a la pared
    bool res = false;
    if (esIzquierda) {
      for (Bloque aux in bloques) {
        if (aux.x < 0) res = true;
      }
    } else {
      for (Bloque aux in bloques) {
        if (aux.x > (Tablero.TABLERO_WIDTH_PIEZAS - 1)) res = true;
      }
    }

    return res;
  }

  void girar(bool esIzquierda) {
    //Formulas obtenidas de la asignatura IG
    if (esIzquierda) {
      for (Bloque element in bloques) {
        double x = element.x;
        element.x = centroPieza.x + centroPieza.y - element.y;
        element.y = centroPieza.y + x - centroPieza.x;
      }

      if (colisionLateralGiro(true) || colisionLateralGiro(false)) {
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

      if (colisionLateralGiro(true) || colisionLateralGiro(false)) {
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
      print("Altura max: ${Tablero.tableroHeight + Tablero.inicioTableroY}\n");
      print("y: ${aux.y}\n");
      if (aux.y >= (Tablero.TABLERO_HEIGHT_PIEZAS-1)) res = true;
    }

    return res;
  }
}
