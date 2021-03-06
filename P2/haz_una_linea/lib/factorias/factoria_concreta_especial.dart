import 'dart:math';

import 'package:haz_una_linea/factorias/factoria_abstracta.dart';
import 'package:haz_una_linea/piezas/pieza.dart';

class FactoriaConcretaEspecial extends FactoriaAbstracta {
  late List<bool> saco; //Indica si ya se ha cogido=true
  List<Pieza>
      especiales; //Lista con piezas especiales para poder sacarlas con una probabilidad distinta a la estipulada por tetris (que salen demasiado frecuentemente)
  double probabilidad; //Probabilidad de que salga una pieza especial

  //Constructor
  FactoriaConcretaEspecial(List<Pieza> piezas, this.especiales, this.probabilidad)
      : super(piezas) {
    saco = List.filled(piezas.length, false);
  }

  //Comprueba si todas las piezas han sido cogidas del saco
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
    int especial = Random().nextInt(100);
    Pieza res = piezasPrototipo[0].clone();

    if (especial < (probabilidad*100)) {
      int indiceEspecial = Random().nextInt(especiales.length);
      res = especiales[indiceEspecial].clone();
    } else {
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

      res = piezasPrototipo[valorAleatorio].clone();
    }

    return res;
  }
}
