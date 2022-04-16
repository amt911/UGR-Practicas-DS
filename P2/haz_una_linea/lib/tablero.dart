import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/factoria_abstracta.dart';
import 'package:haz_una_linea/factoria_concreta.dart';
import 'package:haz_una_linea/factoria_concreta_especial.dart';
import 'package:haz_una_linea/game_over.dart';
import 'package:haz_una_linea/movimientos.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/pausa.dart';
import 'package:haz_una_linea/piezas/cubo_pieza_bomba.dart';
import 'package:haz_una_linea/piezas/cubo_pieza_normal.dart';
import 'package:haz_una_linea/piezas/i_pieza_bomba.dart';
import 'package:haz_una_linea/piezas/i_pieza_normal.dart';
import 'package:haz_una_linea/piezas/l_pieza_bomba.dart';
import 'package:haz_una_linea/piezas/l_pieza_normal.dart';
import 'package:haz_una_linea/piezas/pieza.dart';
import 'package:haz_una_linea/piezas/pieza_mas_bomba.dart';
import 'package:haz_una_linea/piezas/pieza_mas_normal.dart';
import 'package:haz_una_linea/piezas/s_pieza_bomba.dart';
import 'package:haz_una_linea/piezas/s_pieza_normal.dart';
import 'package:haz_una_linea/piezas/t_pieza_bomba.dart';
import 'package:haz_una_linea/piezas/t_pieza_normal.dart';

import 'musica.dart';

// ignore: use_key_in_widget_constructors
class Tablero extends StatefulWidget {
  @override
  State<Tablero> createState() => _Tablero();
}

class _Tablero extends State<Tablero> with WidgetsBindingObserver {
  late Pieza sombra;

  double velocidad = 1; //Velocidad de la musica
  Musica m = Musica();
  Timer? timerPrincipal;
  late Pieza piezaActual;
  Pieza? piezaReservada; // = TPieza();
  List<Pieza> lista = [];
  int contadorLineas = 0;
  int nivel = 0;
  int indiceDelay = 0;
  int lineasAcumuladas = 0;
  bool reservado = false; //false permite reservar
  //List<Pieza> lista = [IPieza()]; //Version debug
  late FactoriaAbstracta fa;
  late List<List<Bloque?>> bloquesPuestos;
  int delay = 1200;
  bool esPausa = false; //false para pausar
  late Queue<Pieza> piezasSiguientes;
  int puntuacion = 0;
  bool fin = false;

  int t = ParametrosTablero.t;
  List<Pieza> listaBombas = [];
  _Tablero() : super() {
    piezaReservada = null;

    lista = [
      IPiezaNormal(),
      LPiezaNormal(true),
      LPiezaNormal(false),
      SPiezaNormal(true),
      SPiezaNormal(false),
      CuboPiezaNormal(),
      TPiezaNormal()
    ];

    if (ParametrosTablero.t == 0) {
      fa = FactoriaConcreta(lista);
    } else {
      listaBombas = [
        PiezaMasNormal(),
        PiezaMasBomba(),
        IPiezaBomba(),
        LPiezaBomba(false),
        LPiezaBomba(true),
        CuboPiezaBomba(),
        SPiezaBomba(false),
        SPiezaBomba(true),
        TPiezaBomba(),
      ];

      fa = FactoriaConcretaEspecial(lista, listaBombas, 0.1);
    }
    bloquesPuestos = List.generate(
        ParametrosTablero.TABLERO_HEIGHT_PIEZAS.toInt(),
        (index) => List.filled(
            ParametrosTablero.TABLERO_WIDTH_PIEZAS.toInt(), null,
            growable: false),
        growable: false);

    piezaActual = fa.crearPieza();
    piezasSiguientes = Queue();

    for (int i = 0; i < 3; i++) {
      piezasSiguientes.add(fa.crearPieza());
    }

    actualizarSombra();

    m.comenzarMusica();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      timerPrincipal!.cancel();
      m.pausarMusica();
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Pausa(m)))
          .then((value) {
        //player = cache.loop("music/musica.mp3");
        //m.reanudarMusica();
        comenzar();
      });
    } //else {
  }

  void actualizarSombra() {
    sombra = piezaActual.clone();
    bajarRapido(sombra);
  }

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
    comenzar();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    timerPrincipal!.cancel();
    super.dispose();
  }

  void meterEnTablero() {
    for (Bloque aux in piezaActual.bloques) {
      if (aux.y >= 0) {
        bloquesPuestos[aux.y.toInt()][aux.x.toInt()] = aux;
      } else {
        fin = true;
      }
    }
    if (t == 1 /* && piezaActual.esbomba()*/) {
      piezaActual.explotar(bloquesPuestos);
    }
  }

  void bajarRapido(Pieza pieza) {
    while (!pieza.estaEnSuelo() &&
        !pieza.estaEncimaPieza(bloquesPuestos) &&
        !gameOver()) {
      pieza.mover(Movimientos.BAJAR);
    }
  }

  void subirNivel() {
    if (contadorLineas >= 10) {
      contadorLineas -= 10;
      nivel++;
      if (nivel <= 9 ||
          nivel == 10 ||
          nivel == 13 ||
          nivel == 16 ||
          nivel == 19 ||
          nivel == 29) {
        indiceDelay++;
        velocidad += 0.034;
      }

      m.setVelocidad(velocidad);

      //Paramos el timer ya que tiene que ser mas rapido y llamamos a comenzar para que se reinicie
      timerPrincipal!.cancel();

      comenzar();
    }
  }

  void moverLineasSuperiores(List<int> lineas) {
    for (int i in lineas) {
      contadorLineas++;
      lineasAcumuladas++;

      for (int f = i; f > 1; f--) {
        for (int c = 0; c < ParametrosTablero.TABLERO_WIDTH_PIEZAS; c++) {
          bloquesPuestos[f][c] = bloquesPuestos[f - 1][c];

          if (bloquesPuestos[f][c] != null) {
            //Si no esta vacio se mueve la componente interna del bloque
            bloquesPuestos[f][c]!.y += 1;
          }
        }
      }
    }
  }

  bool gameOver() {
    //bool fin = false;
    if (!fin) {
      for (Bloque aux in piezaActual.bloques) {
        if (aux.y >= -1 &&
            bloquesPuestos[(aux.y + 1).toInt()][aux.x.toInt()] != null) {
          fin = true;
        }
      }
    }

    return fin;
  }

  void mostrarGameOver() {
    timerPrincipal!.cancel();
    m.pararMusica();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                GameOver(puntuacion, nivel, lineasAcumuladas)));
  }

  void calcularPuntuacion(int lineas) {
    switch (lineas) {
      case 1:
        puntuacion += 40 * (nivel + 1);
        break;

      case 2:
        puntuacion += 100 * (nivel + 1);
        break;

      case 3:
        puntuacion += 300 * (nivel + 1);
        break;

      default:
        puntuacion += 1200 * (nivel + 1);
        break;
    }
  }

  void eliminarLineasCompletas() {
    List<int> lineas = lineasCompletas();

    for (int i in lineas) {
      for (int c = 0; c < ParametrosTablero.TABLERO_WIDTH_PIEZAS; c++) {
        bloquesPuestos[i][c] = null;
      }
    }

    if (lineas.isNotEmpty) {
      calcularPuntuacion(lineas.length);
    }

    moverLineasSuperiores(lineas);
  }

  List<Widget> pintarInfo() {
    Color lima = Colors.lime;
    Color naranja = Colors.orange;
    Color rojo = Colors.red;

    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      lima = Colors.lime.shade900;
      naranja = Colors.orange.shade900;
      rojo = Colors.red.shade900;
    }
    List<Widget> lista = [
      const SizedBox(
        height: 20,
      ),
      Container(
          width: ParametrosTablero.piezaReservadaWidth,
          color: lima,
          child: Text("Score: $puntuacion")),
      const SizedBox(
        height: 20,
      ),
      Container(
          width: ParametrosTablero.piezaReservadaWidth,
          color: naranja,
          child: Text("Level:  $nivel")),
      const SizedBox(
        height: 20,
      ),
      Container(
          width: ParametrosTablero.piezaReservadaWidth,
          color: rojo,
          child: Text("Lines:  $lineasAcumuladas")),
      const SizedBox(
        height: 20,
      ),
    ];

    return lista;
  }

  List<int> lineasCompletas() {
    bool linea;
    List<int> lineas = [];
    for (int f = 0; f < ParametrosTablero.TABLERO_HEIGHT_PIEZAS; f++) {
      linea = true;
      for (int c = 0; c < ParametrosTablero.TABLERO_WIDTH_PIEZAS; c++) {
        if (bloquesPuestos[f][c] == null) {
          linea = false;
        }
      }

      if (linea) {
        lineas.add(f);
      }
    }
    return lineas;
  }

  void comenzar() {
    timerPrincipal = Timer.periodic(
        Duration(milliseconds: ParametrosTablero.delays[indiceDelay]), (timer) {
      setState(() {
        if (!piezaActual.estaEnSuelo() &&
            !piezaActual.estaEncimaPieza(bloquesPuestos) &&
            !gameOver()) {
          piezaActual.mover(Movimientos.BAJAR);
        } else {
          if (fin) {
            mostrarGameOver();
          } else {
            meterEnTablero();
            eliminarLineasCompletas();

            piezaActual = piezasSiguientes.first;

            piezasSiguientes.removeFirst();
            piezasSiguientes.add(fa.crearPieza());

            subirNivel();
            reservado = false;

            actualizarSombra();
          }
        }
      });
    });
  }

  Color cambiarColor(Color color, int valor) {
    int r = color.red + valor;
    int g = color.green + valor;
    int b = color.blue + valor;

    if (r > 255) r = 255;
    if (r < 0) r = 0;

    if (g > 255) g = 255;
    if (g < 0) g = 0;

    if (b > 255) b = 255;
    if (b < 0) b = 0;

    return Color.fromARGB(255, r, g, b);
  }

  Stack pintarTableroPiezas() {
    //Primero se crea una lista con los bloques de la pieza actual
    List<Widget>? bloquesActivos = List.empty(growable: true);

    bloquesActivos.add(Container(
      //El propio tablero
      margin: const EdgeInsets.all(3),
      width: ParametrosTablero.tableroWidth,
      height: ParametrosTablero.tableroHeight,
      color: Colors.black, //Color.fromARGB(255, 0, 0, 0),
    ));

    for (int i = 0; i < ParametrosTablero.TABLERO_HEIGHT_PIEZAS; i++) {
      for (int j = 0; j < ParametrosTablero.TABLERO_WIDTH_PIEZAS; j++) {
        bloquesActivos.add(Positioned(
          top: ((i *
                  (ParametrosTablero.tableroHeight /
                      ParametrosTablero.TABLERO_HEIGHT_PIEZAS)) +
              ParametrosTablero.inicioTableroY),
          left: ((j *
                  (ParametrosTablero.tableroWidth /
                      ParametrosTablero.TABLERO_WIDTH_PIEZAS)) +
              ParametrosTablero.inicioTableroX),
          child: Container(
            width: ParametrosTablero.tableroWidth /
                ParametrosTablero.TABLERO_WIDTH_PIEZAS,
            height: ParametrosTablero.tableroHeight /
                ParametrosTablero.TABLERO_HEIGHT_PIEZAS,
            //color: Colors.white
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                    color: const Color.fromARGB(255, 131, 131, 131))),
          ),
        ));
      }
    }

    for (Bloque aux in sombra.bloques) {
      if (aux.y >= 0) {
        bloquesActivos.add(Positioned(
          //Ejemplo que muestra como se pinta un bloque
          top: ((aux.y *
                  (ParametrosTablero.tableroHeight /
                      ParametrosTablero.TABLERO_HEIGHT_PIEZAS)) +
              ParametrosTablero.inicioTableroY),
          left: ((aux.x *
                  (ParametrosTablero.tableroWidth /
                      ParametrosTablero.TABLERO_WIDTH_PIEZAS)) +
              ParametrosTablero.inicioTableroX),
          child: Container(
            width: ParametrosTablero.tableroWidth /
                ParametrosTablero.TABLERO_WIDTH_PIEZAS,
            height: ParametrosTablero.tableroHeight /
                ParametrosTablero.TABLERO_HEIGHT_PIEZAS,
            //color: aux.color,
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, Colors.grey.red ~/ 2,
                            Colors.grey.green ~/ 2, Colors.grey.blue ~/ 2),
                        width: 5),
                    top: BorderSide(
                        color: cambiarColor(Colors.grey, 50), width: 5),
                    left: BorderSide(
                        color: cambiarColor(Colors.grey, -50), width: 5),
                    right: BorderSide(
                        color: cambiarColor(Colors.grey, -50), width: 5))),
          ),
        ));
      }
    }

    for (Bloque aux in piezaActual.bloques) {
      if (aux.y >= 0) {
        bloquesActivos.add(Positioned(
          //Ejemplo que muestra como se pinta un bloque
          top: ((aux.y *
                  (ParametrosTablero.tableroHeight /
                      ParametrosTablero.TABLERO_HEIGHT_PIEZAS)) +
              ParametrosTablero.inicioTableroY),
          left: ((aux.x *
                  (ParametrosTablero.tableroWidth /
                      ParametrosTablero.TABLERO_WIDTH_PIEZAS)) +
              ParametrosTablero.inicioTableroX),
          child: Container(
            width: ParametrosTablero.tableroWidth /
                ParametrosTablero.TABLERO_WIDTH_PIEZAS,
            height: ParametrosTablero.tableroHeight /
                ParametrosTablero.TABLERO_HEIGHT_PIEZAS,
            //color: aux.color,
            decoration: BoxDecoration(
                color: aux.color,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, aux.color.red ~/ 2,
                            aux.color.green ~/ 2, aux.color.blue ~/ 2),
                        width: 5),
                    top: BorderSide(
                        color: cambiarColor(aux.color, 50), width: 5),
                    left: BorderSide(
                        color: cambiarColor(aux.color, -50), width: 5),
                    right: BorderSide(
                        color: cambiarColor(aux.color, -50), width: 5))),
          ),
        ));
      }
    }

    //Ahora toca la parte de pintar los bloques ya puestos
    for (int i = 0; i < ParametrosTablero.TABLERO_HEIGHT_PIEZAS; i++) {
      for (int j = 0; j < ParametrosTablero.TABLERO_WIDTH_PIEZAS; j++) {
        if (bloquesPuestos[i][j] != null) {
          bloquesActivos.add(Positioned(
              //Ejemplo que muestra como se pinta un bloque
              top: ((bloquesPuestos[i][j]!.y *
                      (ParametrosTablero.tableroHeight /
                          ParametrosTablero.TABLERO_HEIGHT_PIEZAS)) +
                  ParametrosTablero.inicioTableroY),
              left: ((bloquesPuestos[i][j]!.x *
                      (ParametrosTablero.tableroWidth /
                          ParametrosTablero.TABLERO_WIDTH_PIEZAS)) +
                  ParametrosTablero.inicioTableroX),
              child: Container(
                width: ParametrosTablero.tableroWidth /
                    ParametrosTablero.TABLERO_WIDTH_PIEZAS,
                height: ParametrosTablero.tableroHeight /
                    ParametrosTablero.TABLERO_HEIGHT_PIEZAS,
                decoration: BoxDecoration(
                    color: bloquesPuestos[i][j]!.color,
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(
                                255,
                                bloquesPuestos[i][j]!.color.red ~/ 2,
                                bloquesPuestos[i][j]!.color.green ~/ 2,
                                bloquesPuestos[i][j]!.color.blue ~/ 2),
                            width: 5),
                        top: BorderSide(
                            color:
                                cambiarColor(bloquesPuestos[i][j]!.color, 50),
                            width: 5),
                        left: BorderSide(
                            color:
                                cambiarColor(bloquesPuestos[i][j]!.color, -50),
                            width: 5),
                        right: BorderSide(
                            color:
                                cambiarColor(bloquesPuestos[i][j]!.color, -50),
                            width: 5))),
              )));
        }
      }
    }

    //Comentar esta parte, solo sirve para depurar el centro de rotacion
    /*bloquesActivos.add(Positioned(
        //Ejemplo que muestra como se pinta un bloque
        top: ((piezaActual.centroPieza.y *
                (ParametrosTablero.tableroHeight / ParametrosTablero.TABLERO_HEIGHT_PIEZAS)) +
            ParametrosTablero.inicioTableroY),
        left: ((piezaActual.centroPieza.x *
                (ParametrosTablero.tableroWidth / ParametrosTablero.TABLERO_WIDTH_PIEZAS)) +
            ParametrosTablero.inicioTableroX),
        child: Container(
            width: ParametrosTablero.tableroWidth / ParametrosTablero.TABLERO_WIDTH_PIEZAS,
            height: ParametrosTablero.tableroHeight / ParametrosTablero.TABLERO_HEIGHT_PIEZAS,
            color: Colors.white)));*/
    return Stack(children: bloquesActivos);
  }

  List<Widget> piezaReservadaDisplay() {
    List<Widget> listaBloque = [];

    Color color = Colors.cyan;

    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      color = Colors.cyan.shade900;
    }

    listaBloque.add(Positioned(
      width: ParametrosTablero.piezaReservadaTextoWidth,
      height: ParametrosTablero.piezaReservadaTextoHeight,
      child: Container(
          child: const Center(child: Text("Reservada")), color: color),
    ));

    if (piezaReservada != null) {
      for (Bloque i in piezaReservada!.bloques) {
        listaBloque.add(Positioned(
            width: ParametrosTablero.piezaReservadaWidth /
                ParametrosTablero.REJILLA_RESERVADA,
            height: ParametrosTablero.piezaReservadaHeight /
                ParametrosTablero.REJILLA_RESERVADA,
            left: (i.x - 2) *
                ParametrosTablero.piezaReservadaWidth /
                ParametrosTablero.REJILLA_RESERVADA,
            top: (i.y + 4) *
                    ParametrosTablero.piezaReservadaHeight /
                    ParametrosTablero.REJILLA_RESERVADA +
                ParametrosTablero.piezaReservadaTextoHeight,
            child: Container(
              //color: i.color
              decoration: BoxDecoration(
                  color: i.color,
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromARGB(255, i.color.red ~/ 2,
                              i.color.green ~/ 2, i.color.blue ~/ 2),
                          width: 3),
                      top: BorderSide(
                          color: cambiarColor(i.color, 50), width: 3),
                      left: BorderSide(
                          color: cambiarColor(i.color, -50), width: 3),
                      right: BorderSide(
                          color: cambiarColor(i.color, -50), width: 3))),
            )));
      }
    }
    return listaBloque;
  }

  void reservarPieza() {
    if (piezaReservada == null) {
      piezaReservada = piezaActual;
      piezaReservada!.resetPosicion();
      piezaActual = piezasSiguientes.first;

      piezasSiguientes.removeFirst();
      piezasSiguientes.add(fa.crearPieza());
    } else if (!reservado) {
      Pieza aux = piezaActual;
      piezaActual = piezaReservada!;
      piezaReservada = aux;

      piezaReservada!.resetPosicion();
    }
    reservado = true;
  }

  List<Widget> piezasSiguientesDisplay() {
    List<Widget> listaBloque = [];

    Color color = Colors.green;

    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      color = Colors.green.shade900;
    }

    listaBloque.add(Positioned(
        width: ParametrosTablero.piezaReservadaTextoWidth,
        height: ParametrosTablero.piezaReservadaTextoHeight,
        child: Container(
          color: color,
          child: const Center(child: Text("Siguientes: ")),
        )));

    for (Bloque i in piezasSiguientes.toList()[0].bloques) {
      listaBloque.add(Positioned(
          width: ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          height: ParametrosTablero.piezaReservadaHeight /
              ParametrosTablero.REJILLA_RESERVADA,
          left: (i.x - 2) *
              ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          top: (i.y + 4) *
                  ParametrosTablero.piezaReservadaHeight /
                  ParametrosTablero.REJILLA_RESERVADA +
              ParametrosTablero.piezaReservadaTextoHeight,
          child: Container(
            //color: i.color,
            decoration: BoxDecoration(
                color: i.color,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, i.color.red ~/ 2,
                            i.color.green ~/ 2, i.color.blue ~/ 2),
                        width: 3),
                    top: BorderSide(color: cambiarColor(i.color, 50), width: 3),
                    left:
                        BorderSide(color: cambiarColor(i.color, -50), width: 3),
                    right: BorderSide(
                        color: cambiarColor(i.color, -50), width: 3))),
          )));
    }

    for (Bloque i in piezasSiguientes.toList()[1].bloques) {
      listaBloque.add(Positioned(
          width: ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          height: ParametrosTablero.piezaReservadaHeight /
              ParametrosTablero.REJILLA_RESERVADA,
          left: (i.x - 2) *
              ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          top: (i.y + 4) *
                  ParametrosTablero.piezaReservadaHeight /
                  ParametrosTablero.REJILLA_RESERVADA +
              ParametrosTablero.piezaReservadaTextoHeight +
              ParametrosTablero.piezaReservadaHeight,
          child: Container(
            //color: i.color
            decoration: BoxDecoration(
                color: i.color,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, i.color.red ~/ 2,
                            i.color.green ~/ 2, i.color.blue ~/ 2),
                        width: 3),
                    top: BorderSide(color: cambiarColor(i.color, 50), width: 3),
                    left:
                        BorderSide(color: cambiarColor(i.color, -50), width: 3),
                    right: BorderSide(
                        color: cambiarColor(i.color, -50), width: 3))),
          )));
    }

    for (Bloque i in piezasSiguientes.toList()[2].bloques) {
      listaBloque.add(Positioned(
          width: ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          height: ParametrosTablero.piezaReservadaHeight /
              ParametrosTablero.REJILLA_RESERVADA,
          left: (i.x - 2) *
              ParametrosTablero.piezaReservadaWidth /
              ParametrosTablero.REJILLA_RESERVADA,
          top: (i.y + 4) *
                  ParametrosTablero.piezaReservadaHeight /
                  ParametrosTablero.REJILLA_RESERVADA +
              ParametrosTablero.piezaReservadaTextoHeight +
              2 * ParametrosTablero.piezaReservadaHeight,
          child: Container(
            //color: i.color
            decoration: BoxDecoration(
                color: i.color,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, i.color.red ~/ 2,
                            i.color.green ~/ 2, i.color.blue ~/ 2),
                        width: 3),
                    top: BorderSide(color: cambiarColor(i.color, 50), width: 3),
                    left:
                        BorderSide(color: cambiarColor(i.color, -50), width: 3),
                    right: BorderSide(
                        color: cambiarColor(i.color, -50), width: 3))),
          )));
    }
    return listaBloque;
  }

  @override
  Widget build(BuildContext context) {
    //AppBar appBar = AppBar(
    //  title: const Text("Partida nueva"),
    //);

    ParametrosTablero.widthPantalla = MediaQuery.of(context).size.width;
    ParametrosTablero.heightPantalla = MediaQuery.of(context).size.height;

    ParametrosTablero.tableroWidth = 0.75 * ParametrosTablero.widthPantalla;
    ParametrosTablero.tableroHeight = 0.9 *
        (ParametrosTablero
            .heightPantalla); //- appBar.preferredSize.height); //2 * tableroWidth;

    ParametrosTablero.inicioTableroX = 3;
    ParametrosTablero.inicioTableroY = 3;

    ParametrosTablero.piezaReservadaTextoWidth =
        0.23 * ParametrosTablero.widthPantalla;
    ParametrosTablero.piezaReservadaTextoHeight =
        0.05 * ParametrosTablero.widthPantalla;
    ParametrosTablero.piezaReservadaWidth =
        0.23 * ParametrosTablero.widthPantalla;
    ParametrosTablero.piezaReservadaHeight =
        0.23 * ParametrosTablero.widthPantalla;

    return WillPopScope(
        onWillPop: () async {
          m.pararMusica();
          return true;
        },
        child: Scaffold(
            //appBar: appBar,
            body: Column(
          children: [
            Row(
              children: [
                pintarTableroPiezas(),
                //Expanded(
                //child: Column(
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          timerPrincipal!.cancel();
                          //player.clearAll();
                          m.pausarMusica();
                        Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Pausa(m)))
                            .then((value) {
                          //player = cache.loop("music/musica.mp3");
                          //m.reanudarMusica();
                          comenzar();
                        });
                        });
                      },
                      child: const Icon(Icons.pause, size: 32),
                    ),

                    Container(
                      height: ParametrosTablero.piezaReservadaHeight,
                      width: ParametrosTablero.piezaReservadaWidth,
                      color: Colors.grey,
                      child: Stack(children: piezaReservadaDisplay()),
                    ),

                    const SizedBox(
                      height: 8,
                    ), //Para darle un espacio entre containers

                    Container(
                        width: ParametrosTablero.piezaReservadaWidth,
                        height: 3 * ParametrosTablero.piezaReservadaHeight +
                            ParametrosTablero.piezaReservadaTextoHeight,
                        color: Colors.grey,
                        child: Stack(children: piezasSiguientesDisplay())),

                    const SizedBox(
                      height: 8,
                    ), //Para darle un espacio entre containers

                    Column(
                      //???Quizas esto se pueda hacer con un grid
                      children: pintarInfo(),
                    ),

                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            reservarPieza();
                          });
                        },
                        child: const Text("Save")),
                  ],
                ),
              ],
            ),
            Expanded(
                flex: 5,
                child: Row(
                  mainAxisSize: MainAxisSize.max, //Para que se centre
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, //Para que se dejen un espacio uniforme
                  //crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (!piezaActual.colisionLateralPieza(
                            true, bloquesPuestos)) {
                          setState(() {
                            piezaActual.mover(Movimientos.IZQUIERDA);
                            actualizarSombra();
                            //sombra.mover(Movimientos.IZQUIERDA);
                          });
                        }
                      },
                      child: const Icon(Icons.arrow_back, size: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!piezaActual.giroChoque(
                            Movimientos.GIRAR_IZDA, bloquesPuestos)) {
                          setState(() {
                            piezaActual.girar(Movimientos.GIRAR_IZDA);
                            actualizarSombra();
                            //sombra.girar(Movimientos.GIRAR_IZDA);
                          });
                        }
                      },
                      child: const Icon(Icons.rotate_left, size: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!piezaActual.estaEnSuelo() &&
                            !piezaActual.estaEncimaPieza(bloquesPuestos) &&
                            !gameOver()) {
                          setState(() {
                            piezaActual.mover(Movimientos.BAJAR);
                          });
                        }
                      },
                      onLongPress: () {
                        setState(() {
                          //piezaActual.mover(3);
                          bajarRapido(piezaActual);
                        });
                      },
                      child: const Icon(Icons.arrow_downward, size: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!piezaActual.giroChoque(
                            Movimientos.GIRAR_DCHA, bloquesPuestos)) {
                          setState(() {
                            piezaActual.girar(Movimientos.GIRAR_DCHA);
                            actualizarSombra();
                            //sombra.girar(Movimientos.GIRAR_DCHA);
                          });
                        }
                      },
                      child: const Icon(Icons.rotate_right, size: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!piezaActual.colisionLateralPieza(
                            false, bloquesPuestos)) {
                          setState(() {
                            piezaActual.mover(Movimientos.DERECHA);
                            actualizarSombra();
                            //sombra.mover(Movimientos.DERECHA);
                          });
                        }
                      },
                      child: const Icon(Icons.arrow_forward, size: 32),
                    ),
                  ],
                )),
          ],
        )));
  }
}
