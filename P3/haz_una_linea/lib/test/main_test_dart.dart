import 'package:haz_una_linea/musica.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HazUnaLinea', () {
    test('El volumen de la música debería cambiar a 0 y luego a 1', () {
      TestWidgetsFlutterBinding.ensureInitialized();
      Musica m = Musica();
      m.comenzarMusica();
      m.setSonido();

      expect(m.volumen, 0);

      m.setSonido();

      expect(m.volumen, 1);
    });
  });
}
