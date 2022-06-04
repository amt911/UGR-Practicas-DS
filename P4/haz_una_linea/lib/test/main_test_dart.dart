import 'package:flutter/material.dart';
import 'package:haz_una_linea/factorias/factoria_abstracta.dart';
import 'package:haz_una_linea/factorias/factoria_concreta.dart';
import 'package:haz_una_linea/musica.dart';
import 'package:haz_una_linea/tablero.dart';
import 'package:test/test.dart';
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

      ///En esta parte se mueve cada pieza y luego una vez pegada se mueve de
      /// de nuevo para comprobar que no se salga del tablero tanto por la izquiera
      /// como por la derecha.
      for (int i = 0; i < lista.length; i++) {
        piezaActual = lista[i].clone();

        //Se mueve la pieza a la izquierda
        for (int j = 0; j < 4; j++) {
          piezaActual.mover(Movimientos.IZQUIERDA);
        }
        //Se mueve una vez más para comprobar que no se salga
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
      //Se simula el tablero del juego
      List<List<Bloque?>> bloquesPuestos = List.generate(
          ParametrosTablero.TABLERO_HEIGHT_PIEZAS.toInt(),
          (index) => List.filled(
              ParametrosTablero.TABLERO_WIDTH_PIEZAS.toInt(), null,
              growable: false),
          growable: false);

      //Se ponen dos bloques de prueba que deben desaparecer al explotar la bomba
      Bloque a =
          Bloque(0, (ParametrosTablero.TABLERO_HEIGHT_PIEZAS - 1), Colors.red);
      Bloque b =
          Bloque(1, (ParametrosTablero.TABLERO_HEIGHT_PIEZAS - 1), Colors.red);
      bloquesPuestos[(ParametrosTablero.TABLERO_HEIGHT_PIEZAS - 1).toInt()][0] =
          a;
      bloquesPuestos[(ParametrosTablero.TABLERO_HEIGHT_PIEZAS - 1).toInt()][1] =
          b;

      CuboPiezaBomba bomba = CuboPiezaBomba();

      bomba.mover(Movimientos.IZQUIERDA);
      bomba.mover(Movimientos.IZQUIERDA);
      bomba.mover(Movimientos.IZQUIERDA);
      bomba.mover(Movimientos.IZQUIERDA);

      for (int i = 0;
          i < (ParametrosTablero.TABLERO_HEIGHT_PIEZAS - 1).toInt();
          i++) {
        bomba.mover(Movimientos.BAJAR);
      }

      bomba.explotar(bloquesPuestos);
      expect(
          bloquesPuestos[(ParametrosTablero.TABLERO_HEIGHT_PIEZAS - 1).toInt()]
              [0],
          isNull);
      expect(
          bloquesPuestos[(ParametrosTablero.TABLERO_HEIGHT_PIEZAS - 1).toInt()]
              [1],
          isNull);
    });

    test('La pieza esta en el suelo', () {
      CuboPiezaNormal pieza = CuboPiezaNormal();

      for (int i = 0;
          i < ParametrosTablero.TABLERO_HEIGHT_PIEZAS.toInt();
          i++) {
        pieza.mover(Movimientos.BAJAR);
      }

      bool estaensuelo = pieza.estaEnSuelo();
      expect(estaensuelo, isTrue);
    });

    test('Todas las piezas creadas son distintas', () {
      List<Pieza> lista = [
        IPiezaNormal(),
        LPiezaNormal(true),
        LPiezaNormal(false),
        SPiezaNormal(true),
        SPiezaNormal(false),
        CuboPiezaNormal(),
        TPiezaNormal()
      ];
      FactoriaAbstracta fa = FactoriaConcreta(lista);

      Map contColores = {};

      for (Pieza aux in lista) {
        contColores[aux.bloques[0].color] = 0;
      }

      for (int i = 0; i < 7; i++) {
        Pieza aux = fa.crearPieza();
        contColores[aux.bloques[0].color]++;
      }

      bool todosDistintos = true;

      for (var aux in contColores.values) {
        if (aux > 1) {
          todosDistintos = false;
        }
      }

      expect(todosDistintos, isTrue);
    });

    test('La pieza detecta colision con otra de abajo', () {
      //Creamos un tablero
      List<List<Bloque?>> bloquesPuestos = List.generate(
          ParametrosTablero.TABLERO_HEIGHT_PIEZAS.toInt(),
          (index) => List.filled(
              ParametrosTablero.TABLERO_WIDTH_PIEZAS.toInt(), null,
              growable: false),
          growable: false);

      IPiezaNormal a = IPiezaNormal();
      IPiezaNormal b = IPiezaNormal();

      for (int i = 0; i < 5; i++) {
        a.mover(Movimientos.BAJAR);
      }

      for (int i = 0; i < 4; i++) {
        b.mover(Movimientos.BAJAR);
      }

      for (Bloque aux in a.bloques) {
        bloquesPuestos[aux.y.toInt()][aux.x.toInt()] = aux;
      }

      bool res = b.estaEncimaPieza(bloquesPuestos);

      expect(res, isTrue);
    });

    test('Cuando se forman 10 bloques horizontales se destruye una linea', () {
      TableroState t = TableroState();

      //Simulamos la caida de las piezas y las metemos en el tablero ya que
      //el timer no funciona porque se instancia en initState de flutter
      t.piezaActual = CuboPiezaNormal();

      //Vamos poniendo las piezas formando una linea
      for (int i = 0; i < 4; i++) {
        t.piezaActual.mover(Movimientos.DERECHA);
      }
      t.bajarRapido(t.piezaActual);
      t.meterEnTablero();

      t.piezaActual = CuboPiezaNormal();
      for (int i = 0; i < 2; i++) {
        t.piezaActual.mover(Movimientos.DERECHA);
      }
      t.bajarRapido(t.piezaActual);
      t.meterEnTablero();

      t.piezaActual = CuboPiezaNormal();
      t.bajarRapido(t.piezaActual);
      t.meterEnTablero();

      t.piezaActual = CuboPiezaNormal();
      for (int i = 0; i < 4; i++) {
        t.piezaActual.mover(Movimientos.IZQUIERDA);
      }
      t.bajarRapido(t.piezaActual);
      t.meterEnTablero();

      t.piezaActual = CuboPiezaNormal();
      for (int i = 0; i < 2; i++) {
        t.piezaActual.mover(Movimientos.IZQUIERDA);
      }
      t.bajarRapido(t.piezaActual);
      t.meterEnTablero();

      //Eliminamos la linea que hemos creado a base de cubos
      t.eliminarLineasCompletas();

      //Ahora se comprueba que se haya eliminado la linea del tablero
      bool todosNulos = true;

      for (int i = 0;
          todosNulos && i < ParametrosTablero.TABLERO_WIDTH_PIEZAS;
          i++) {
        if (t.bloquesPuestos[
                (ParametrosTablero.TABLERO_HEIGHT_PIEZAS - 1).toInt()][i] !=
            null) {
          todosNulos = false;
        }
      }

      expect(todosNulos, isTrue);
    });
  });
}
