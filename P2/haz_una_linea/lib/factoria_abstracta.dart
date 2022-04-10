import 'dart:math';
import 'package:haz_una_linea/cubopieza.dart';
import 'package:haz_una_linea/ipieza.dart';
import 'package:haz_una_linea/lpieza.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/spieza.dart';
import 'package:haz_una_linea/tpieza.dart';

abstract class FactoriaAbstracta {
  List<Pieza> piezasPrototipo;

  FactoriaAbstracta(this.piezasPrototipo);

  Pieza crearPieza() {
    Pieza pieza=LPieza(true);   //Hay que asignarle un valor a la fuerza
    int valorAleatorio = Random().nextInt(piezasPrototipo.length);

    switch (valorAleatorio) {
      case 0:
        pieza = LPieza(true);
        break;

      case 1:
        pieza = LPieza(false);
        break;

      case 2:
        pieza = IPieza();
        break;

      case 3:
        pieza = SPieza(true);
        break;

      case 4:
        pieza = SPieza(false);
        break;

      case 5:
        pieza = CuboPieza();
        break;

      case 6:
        pieza = TPieza();
        break;
    }

    return pieza;
  }
}
