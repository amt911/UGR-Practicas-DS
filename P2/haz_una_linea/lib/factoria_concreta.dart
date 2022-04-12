import 'dart:math';

import 'package:haz_una_linea/factoria_abstracta.dart';
import 'package:haz_una_linea/pieza.dart';

class FactoriaConcreta extends FactoriaAbstracta {
  late List<bool> saco; //Indica si ya se ha cogido=true

  FactoriaConcreta(List<Pieza> piezas) : super(piezas) {
    saco = List.filled(piezas.length, false);
  }

  bool _todosCogidos() {
    bool res = true;

    for (bool aux in saco) {
      if (!aux) {
        res = false;
      }
    }

    return res;
  }

  @override
  Pieza crearPieza() {
    if (_todosCogidos()) {
      for (int i = 0; i < saco.length; i++) {
        saco[i] = false;
      }
    }

    int valorAleatorio = -1;

    do {
      valorAleatorio = Random().nextInt(piezasPrototipo.length);
    } while (saco[valorAleatorio] == true);

    saco[valorAleatorio] = true;
    
    Pieza res = piezasPrototipo[valorAleatorio].clone();

    return res;
  }
}
