import 'package:haz_una_linea/pieza.dart';

abstract class FactoriaAbstracta {
  List<Pieza> piezasPrototipo;

  FactoriaAbstracta(this.piezasPrototipo);

  Pieza crearPieza();
}