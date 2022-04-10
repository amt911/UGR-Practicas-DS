import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/tablero.dart';

class IPieza extends Pieza {
  IPieza() : super() {
    int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
    bloques[0] = Bloque(centro - 2, -3);
    bloques[1] = Bloque(centro - 1, -3);
    bloques[2] = Bloque(centro + 0, -3);
    bloques[3] = Bloque(centro + 1, -3);

    //Comprobar el centro de esta pieza
    //centroPieza = bloques[1];

    centroPieza = Bloque((bloques[1].x + bloques[2].x) / 2, -2.5);
  }

  @override
  Pieza clone() {
    List<Bloque> newBloques = List.filled(4, Bloque(-1, -1));
    Bloque newCentro = centroPieza.clone();

    for (int i = 0; i < bloques.length; i++) {
      newBloques[i] = bloques[i].clone();
    }

    Pieza resultado = IPieza();

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }

  @override
  void mover(int direccion){
    super.mover(direccion);

    switch (direccion) {
      case 1: //Izquierda
        centroPieza.x -= 1;
        break;

      case 2: //Derecha
        centroPieza.x += 1;
        break;

      case 3: //Abajo
        centroPieza.y += 1;
        break;
    }
  }
}
