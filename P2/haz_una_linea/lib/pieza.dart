import 'package:flutter/material.dart';

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
        for (Bloque element in bloques) {
          element.x -= 1;
        }
        //centroPieza.x -= 1;
        break;

      case 2: //Derecha
        for (Bloque element in bloques) {
          element.x += 1;
        }
        //centroPieza.x += 1;
        break;

      case 3: //Abajo
        for (Bloque element in bloques) {
          element.y += 1;
        }
        //centroPieza.y += 1;
        break;
    }
  }

  void girar(bool esIzquierda) {
    //Formulas obtenidas de la asignatura IG
    if (esIzquierda) {
      for (Bloque element in bloques) {
        double x = element.x;
        print("ANTES: x: ${element.x}, y: ${element.y}\n");
        print("CENTROPIEZA, X: ${centroPieza.x}, y: ${centroPieza.y}\n");
        element.x = centroPieza.x + centroPieza.y - element.y;
        element.y = centroPieza.y + x - centroPieza.x;
        print("CENTROPIEZA, X: ${centroPieza.x}, y: ${centroPieza.y}\n");
        print("DESPUES: x: ${element.x}, y: ${element.y}\n");
      }
    } else {
      for (Bloque element in bloques) {
        double x = element.x;
        element.x = centroPieza.x - centroPieza.y + element.y;
        element.y = centroPieza.y - x + centroPieza.x;
      }
    }
  }
}
