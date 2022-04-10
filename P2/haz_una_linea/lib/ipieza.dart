import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/pieza.dart';

class IPieza extends Pieza {
  IPieza();

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
}
