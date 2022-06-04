import 'package:flutter/material.dart';
import 'package:haz_una_linea/pantallas/inicio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Cambio de icono al apagar/encender la musica',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(720, 1280);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(const MyApp());
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

  testWidgets('Aparece la pantalla de Game Over', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(720, 1280);
    tester.binding.window.devicePixelRatioTestValue = 1.0;
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text("Partida normal"));
    await tester.pumpAndSettle();

    for (int i = 0; i < 10; i++) {
      await tester.pump(const Duration(minutes: 1));
    }

    expect(find.text("GAME OVER"), findsOneWidget);
  });

  testWidgets(
      'Al salir de la partida desde el menú de pausa regresa al menú principal',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(720, 1280);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text("Partida normal"));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.pause));
    await tester.pumpAndSettle();

    await tester.tap(find.text("Salir de la partida"));
    await tester.pumpAndSettle();

    expect(find.text("Partida normal"), findsOneWidget);
  });

    testWidgets(
      'Al reservar pieza, esta aparece en la pantalla',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(720, 1280);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(const MyApp());
    
    await tester.tap(find.text("Partida normal"));
    await tester.pumpAndSettle();

    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key("Pieza Reservada 1")), findsOneWidget);
  });
}
