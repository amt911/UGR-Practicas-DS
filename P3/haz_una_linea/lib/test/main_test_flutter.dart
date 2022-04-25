import 'package:flutter/material.dart';
import 'package:haz_una_linea/pantallas/inicio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Cambio de icono al apagar/encender la musica', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(720, 1280);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(MyApp());
    expect(find.text("Partida normal"), findsOneWidget);

    //Tablero
    await tester.tap(find.text("Partida normal"));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.pause));
    await tester.pumpAndSettle();

    await tester.tap(find.text("Sonido On/Off"));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.volume_off), findsOneWidget);

    await tester.tap(find.text("Sonido On/Off"));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.volume_up), findsOneWidget);
  });
}
