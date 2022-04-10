import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/tablero.dart';
class LPieza extends Pieza{
  bool inverso;
  LPieza(this.inverso){
    if(inverso){
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0] = Bloque(centro - 1, -3);
      bloques[1] = Bloque(centro+0, -3);
      bloques[2] = Bloque(centro + 1, -3);
      bloques[3] = Bloque(centro + 1, -4);

      //Comprobar el centro de esta pieza
      centroPieza = bloques[1];      
    }
    else{
      int centro = (Tablero.TABLERO_WIDTH_PIEZAS / 2).floor();
      bloques[0] = Bloque(centro - 1, -3);
      bloques[1] = Bloque(centro+0, -3);
      bloques[2] = Bloque(centro + 1, -3);
      bloques[3] = Bloque(centro + 1, -2);

      //Comprobar el centro de esta pieza
      centroPieza = bloques[1];      
    }
  }  

  @override
  Pieza clone() {
    List<Bloque> newBloques = List.filled(4, Bloque(-1, -1));
    Bloque newCentro = centroPieza.clone();

    for (int i = 0; i < bloques.length; i++) {
      newBloques[i] = bloques[i].clone();
    }

    Pieza resultado = LPieza(inverso);

    resultado.bloques = newBloques;
    resultado.centroPieza = newCentro;

    return resultado;
  }
}  
