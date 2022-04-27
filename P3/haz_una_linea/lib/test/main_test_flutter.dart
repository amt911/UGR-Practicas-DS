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
      'Le doy una vez al boton de Save',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(720, 1280);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(const MyApp());

    CuboPiezaNormal a = CuboPiezaNormal();

    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    expect(find.text("Save"), findsOneWidget);
  });

/*
  //No se si estara bien
  testWidgets(
      'Le doy 2 veces vez al boton de Save',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(720, 1280);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    await tester.pumpWidget(const MyApp());

    IPiezaNormal a = IPiezaNormal();

    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    Pieza aux = a;
    CuboPiezaNormal b = CuboPiezaNormal();

    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    //Operacion de igualdad entre piezas

    bool iguales = true;

    for (int i=0;i<3;i++){
      if (aux.bloques[i].get(_x) != b.bloques[i].get(_x) || aux.bloques[i].get(_y) != PiezaReservada.bloques[i].get(_y) || aux.bloques[i].get(color) != PiezaReservada.bloques[i].get(color) ){
        iguales = false;
      }
    }

    expect(iguales, true);
  });

*/

//Descartado por ahora
  
}
