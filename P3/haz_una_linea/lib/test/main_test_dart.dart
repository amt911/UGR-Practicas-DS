import 'package:flutter/material.dart';
import 'package:haz_una_linea/musica.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/piezas/bloque.dart';
import 'package:haz_una_linea/piezas/cubo_pieza_bomba.dart';
import 'package:haz_una_linea/piezas/cubo_pieza_normal.dart';
import 'package:haz_una_linea/piezas/i_pieza_normal.dart';
import 'package:haz_una_linea/piezas/l_pieza_normal.dart';
import 'package:haz_una_linea/piezas/movimientos.dart';
import 'package:haz_una_linea/piezas/pieza.dart';
import 'package:haz_una_linea/piezas/s_pieza_normal.dart';
import 'package:haz_una_linea/piezas/t_pieza_normal.dart';

void main() {
  group('HazUnaLinea', () {
    test('El volumen de la música debería cambiar a 0', () {
      Musica m = Musica();

      m.setSonido();
      expect(m.volumen, 0);
    });

    test('El volumen de la música debería cambiar a 1', () {
      Musica m = Musica();

      m.setSonido();
      m.setSonido();

      expect(m.volumen, 1);
    });

    test('La pieza no se debe mover en los bordes del tablero', () {
      List<Pieza> lista = [
        IPiezaNormal(),
        LPiezaNormal(true),
        LPiezaNormal(false),
        SPiezaNormal(true),
        SPiezaNormal(false),
        CuboPiezaNormal(),
        TPiezaNormal()
      ];

      Pieza piezaActual;

      for (int i = 0; i < lista.length; i++) {
        piezaActual = lista[i].clone();

        for (int j = 0; j < 4; j++) {
          piezaActual.mover(Movimientos.IZQUIERDA);
        }
        piezaActual.mover(Movimientos.IZQUIERDA);

        for (Bloque aux in piezaActual.bloques) {
          expect(aux.x, isNotNull);
          expect(aux.x, greaterThanOrEqualTo(0));
        }

        piezaActual.resetPosicion();

        for (int j = 0; j < 4; j++) {
          piezaActual.mover(Movimientos.DERECHA);
        }

        piezaActual.mover(Movimientos.DERECHA);

        for (Bloque aux in piezaActual.bloques) {
          expect(aux.x, isNotNull);
          expect(aux.x,
              lessThanOrEqualTo(ParametrosTablero.TABLERO_WIDTH_PIEZAS - 1));
        }
      }
    });

    test('La bomba explota', () {
      List<List<Bloque?>> bloquesPuestos = List.generate(
          ParametrosTablero.TABLERO_HEIGHT_PIEZAS.toInt(),
          (index) => List.filled(
              ParametrosTablero.TABLERO_WIDTH_PIEZAS.toInt(), null,
              growable: false),
          growable: false);

      Bloque a = Bloque(0, 19, Colors.red);
      Bloque b = Bloque(1, 19, Colors.red);
      bloquesPuestos[19][0] = a;
      bloquesPuestos[19][1] = b;

      CuboPiezaBomba bomba = CuboPiezaBomba();

      bomba.mover(Movimientos.IZQUIERDA);
      bomba.mover(Movimientos.IZQUIERDA);
      bomba.mover(Movimientos.IZQUIERDA);
      bomba.mover(Movimientos.IZQUIERDA);

      for (int i = 0; i < 19; i++) {
        bomba.mover(Movimientos.BAJAR);
      }

      bomba.explotar(bloquesPuestos);
      expect(bloquesPuestos[19][0], isNull);
      expect(bloquesPuestos[19][1], isNull);
    });

    test('La pieza esta en el suelo', () {
      List<List<Bloque?>> bloquesPuestos = List.generate(
          ParametrosTablero.TABLERO_HEIGHT_PIEZAS.toInt(),
          (index) => List.filled(
              ParametrosTablero.TABLERO_WIDTH_PIEZAS.toInt(), null,
              growable: false),
          growable: false);

      CuboPiezaNormal pieza = CuboPiezaNormal();

      for (int i = 0; i < 20; i++) {
        pieza.mover(Movimientos.BAJAR);
      }

      bool estaensuelo = pieza.estaEnSuelo();
      expect(estaensuelo, isTrue);
    });
  });
}
