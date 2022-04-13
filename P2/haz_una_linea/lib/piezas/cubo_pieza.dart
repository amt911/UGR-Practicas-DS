import 'package:haz_una_linea/movimientos.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/piezas/pieza.dart';
import 'package:haz_una_linea/tablero.dart';

abstract class CuboPieza extends Pieza {
  @override
  void resetPosicion() {
    int centro = (ParametrosTablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0].setXY(centro - 1, -1);
    bloques[1].setXY(centro + 0, -1);
    bloques[2].setXY(centro - 1, -2);
    bloques[3].setXY(centro + 0, -2);

    centroPieza.setXY(centro + 0, -1);
  }

  @override
  void girar(Movimientos mov) {
    //Las piezas que son cubos no giran
  }
}
