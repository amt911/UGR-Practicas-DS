import 'dart:math';

import 'package:haz_una_linea/factoria_abstracta.dart';
import 'package:haz_una_linea/pieza.dart';

class FactoriaConcreta extends FactoriaAbstracta {
  FactoriaConcreta(List<Pieza> piezas) : super(piezas);

  @override
  Pieza crearPieza() {
    int valorAleatorio = Random().nextInt(piezasPrototipo.length);

    Pieza res = piezasPrototipo[valorAleatorio].clone();
    return res;
  }
}
