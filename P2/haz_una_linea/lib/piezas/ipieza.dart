
import 'package:haz_una_linea/piezas/pieza.dart';
import 'package:haz_una_linea/tablero.dart';

abstract class IPieza extends Pieza {
  @override
  void resetPosicion() {
    int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0].setXY(centro - 2, -1);
    bloques[1].setXY(centro - 1, -1);
    bloques[2].setXY(centro + 0, -1);
    bloques[3].setXY(centro + 1, -1);

    //Comprobar el centro de esta pieza
    //centroPieza = bloques[1];

    centroPieza.setXY((bloques[1].x + bloques[2].x) / 2, -1.5);
  }
}
