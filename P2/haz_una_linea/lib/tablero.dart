//import 'dart:html';

import 'dart:async';
import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/cubopieza.dart';
import 'package:haz_una_linea/factoria_abstracta.dart';
import 'package:haz_una_linea/factoria_concreta.dart';
import 'package:haz_una_linea/game_over.dart';
import 'package:haz_una_linea/ipieza.dart';
import 'package:haz_una_linea/lpieza.dart';
import 'package:haz_una_linea/pausa.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/spieza.dart';
import 'package:haz_una_linea/tpieza.dart';
import 'package:audioplayers/audioplayers.dart';

import 'Musica.dart';

class Tablero extends StatefulWidget {
  static double tableroWidth = 0; // = MediaQuery.of(context).size.width;
  static double tableroHeight = 0; // = 640;
  static double widthPantalla = 0;
  static double heightPantalla = 0;
  static double inicioTableroX = 0;
  static double inicioTableroY = 0;
  static const double TABLERO_WIDTH_PIEZAS = 10;
  static const double TABLERO_HEIGHT_PIEZAS = 20;
  static double piezaReservadaTextoWidth = 0;
  static double piezaReservadaTextoHeight = 0;
  static double piezaReservadaWidth = 0;
  static double piezaReservadaHeight = 0;
  static const double REJILLA_RESERVADA = 6;

  static const List<int> delays = [
    1600,
    1434,
    1267,
    1100,
    934,
    767,
    600,
    434,
    267,
    200,
    167,
    134,
    100,
    67,
    34
  ];

  @override
  State<Tablero> createState() => _Tablero();
}

class _Tablero extends State<Tablero> {
  double velocidad = 1;
  Musica m = Musica();
  Timer? timerPrincipal;
  late Pieza piezaActual;
  Pieza? piezaReservada = null; // = TPieza();
  List<Pieza> lista = [
    IPieza(),
    LPieza(true),
    LPieza(false),
    SPieza(true),
    SPieza(false),
    CuboPieza(),
    TPieza()
  ];
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
  //bool parar = false;   //Solamente sirve para parar las piezas y depurarlas

  _Tablero() : super() {
    bloquesPuestos = List.generate(
        Tablero.TABLERO_HEIGHT_PIEZAS.toInt(),
        (index) => List.filled(Tablero.TABLERO_WIDTH_PIEZAS.toInt(), null,
            growable: false),
        growable: false);

    fa = FactoriaConcreta(lista);
    piezaActual = fa.crearPieza();
    piezasSiguientes = Queue();

    for (int i = 0; i < 3; i++) {
      piezasSiguientes.add(fa.crearPieza());
    }

    m.comenzarMusica();
  }

  @override
  void initState() {
    super.initState();
    comenzar();
  }

  @override
  void dispose() {
    timerPrincipal!.cancel();
    super.dispose();
  }

  void meterEnTablero() {
    //bool fin = false;

    for (Bloque aux in piezaActual.bloques) {
      if (aux.y >= 0) {
        bloquesPuestos[aux.y.toInt()][aux.x.toInt()] = aux;
      } else {
        fin = true;
      }
    }

    //if (fin) mostrarGameOver();
  }

  void bajarRapido() {
    while (!piezaActual.estaEnSuelo() && !estaEncimaPieza(piezaActual) && !gameOver()) {
      piezaActual.mover(3);
    }
  }

  bool estaEncimaPieza(Pieza pieza) {
    bool res = false;
    for (Bloque aux in pieza.bloques) {
      //Solamente se comprueba si el bloque se encuentra dentro del tablero
      if ((aux.y >= 0 && aux.y < Tablero.TABLERO_HEIGHT_PIEZAS) &&
          bloquesPuestos[(aux.y + 1).toInt()][aux.x.toInt()] != null) {
        res = true;
      }
    }

    return res;
  }

  bool colisionLateralPieza(bool esIzquierda) {
    bool res = false;

    if (esIzquierda) {
      for (Bloque aux in piezaActual.bloques) {
        if ((aux.x > 0) &&
            (aux.y >= 0) &&
            (bloquesPuestos[aux.y.toInt()][(aux.x - 1).toInt()] != null)) {
          res = true;
        }
      }
    } else {
      for (Bloque aux in piezaActual.bloques) {
        if ((aux.x < (Tablero.TABLERO_WIDTH_PIEZAS - 1)) &&
            (aux.y >= 0) &&
            (bloquesPuestos[aux.y.toInt()][(aux.x + 1).toInt()] != null)) {
          res = true;
        }
      }
    }

    return res;
  }

  bool giroChoque(bool esIzquierda) {
    Pieza bloqueAux = piezaActual.clone(); //Para no modificar la pieza actual
    bloqueAux.girar(
        esIzquierda); //Se gira (incluye las restricciones laterales) para comprobar si se solapan
    bool res = false;

    for (Bloque aux in bloqueAux.bloques) {
      if ((aux.y >= 0 && aux.y < Tablero.TABLERO_HEIGHT_PIEZAS) &&
          bloquesPuestos[aux.y.toInt()][aux.x.toInt()] != null) {
        res = true;
      }
    }

    return res;
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

      //print("VELOCIDAD: $velocidad\n");
      //print("Nivel: $nivel\n");
      m.setVelocidad(velocidad);
      //Paramos el timer ya que tiene que ser mas rapido y llamamos a comenzar para que se reinicie
      timerPrincipal!.cancel();

      comenzar();
    }
  }

  void moverLineasSuperiores(List<int> lineas) {
    //bloquesPuestos[3][3] = Bloque(3, 3, Colors.black);
    for (int i in lineas) {
      contadorLineas++;
      lineasAcumuladas++;
      //print("i: ${i}\n");
      for (int f = i; f > 1; f--) {
        for (int c = 0; c < Tablero.TABLERO_WIDTH_PIEZAS; c++) {
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

    //if (fin) {
    //  print("HE ACABADO DE VIVIR\n");
    //  mostrarGameOver();
    //  //timerPrincipal!.cancel();
    //}

    return fin;
  }

  void mostrarGameOver() {
    timerPrincipal!.cancel();
    //print("GAME OVER JAJAJAJA\n");
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
    //print(lineas.length);

    for (int i in lineas) {
      for (int c = 0; c < Tablero.TABLERO_WIDTH_PIEZAS; c++) {
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
          width: Tablero.piezaReservadaWidth,
          color: lima,
          child: Text("Score: $puntuacion")),
      const SizedBox(
        height: 20,
      ),
      Container(
          width: Tablero.piezaReservadaWidth,
          color: naranja,
          child: Text("Level:  $nivel")),
      const SizedBox(
        height: 20,
      ),
      Container(
          width: Tablero.piezaReservadaWidth,
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
    for (int f = 0; f < Tablero.TABLERO_HEIGHT_PIEZAS; f++) {
      linea = true;
      for (int c = 0; c < Tablero.TABLERO_WIDTH_PIEZAS; c++) {
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
        Duration(milliseconds: Tablero.delays[indiceDelay]), (timer) {
      setState(() {
        if (!piezaActual.estaEnSuelo() &&
            !estaEncimaPieza(piezaActual) &&
            !gameOver()) {
          piezaActual.mover(3); //PASAR EL MOVIMIENTO A ENUMERADO???
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
      width: Tablero.tableroWidth,
      height: Tablero.tableroHeight,
      color: Colors.black, //Color.fromARGB(255, 0, 0, 0),
    ));

    for (int i = 0; i < Tablero.TABLERO_HEIGHT_PIEZAS; i++) {
      for (int j = 0; j < Tablero.TABLERO_WIDTH_PIEZAS; j++) {
        bloquesActivos.add(Positioned(
          top: ((i * (Tablero.tableroHeight / Tablero.TABLERO_HEIGHT_PIEZAS)) +
              Tablero.inicioTableroY),
          left: ((j * (Tablero.tableroWidth / Tablero.TABLERO_WIDTH_PIEZAS)) +
              Tablero.inicioTableroX),
          child: Container(
            width: Tablero.tableroWidth / Tablero.TABLERO_WIDTH_PIEZAS,
            height: Tablero.tableroHeight / Tablero.TABLERO_HEIGHT_PIEZAS,
            //color: Colors.white
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                    color: const Color.fromARGB(255, 131, 131, 131))),
          ),
        ));
      }
    }
    for (Bloque aux in piezaActual.bloques) {
      if (aux.y >= 0) {
        bloquesActivos.add(Positioned(
          //Ejemplo que muestra como se pinta un bloque
          top: ((aux.y *
                  (Tablero.tableroHeight / Tablero.TABLERO_HEIGHT_PIEZAS)) +
              Tablero.inicioTableroY),
          left:
              ((aux.x * (Tablero.tableroWidth / Tablero.TABLERO_WIDTH_PIEZAS)) +
                  Tablero.inicioTableroX),
          child: Container(
            width: Tablero.tableroWidth / Tablero.TABLERO_WIDTH_PIEZAS,
            height: Tablero.tableroHeight / Tablero.TABLERO_HEIGHT_PIEZAS,
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
    for (int i = 0; i < Tablero.TABLERO_HEIGHT_PIEZAS; i++) {
      for (int j = 0; j < Tablero.TABLERO_WIDTH_PIEZAS; j++) {
        if (bloquesPuestos[i][j] != null) {
          bloquesActivos.add(Positioned(
              //Ejemplo que muestra como se pinta un bloque
              top: ((bloquesPuestos[i][j]!.y *
                      (Tablero.tableroHeight / Tablero.TABLERO_HEIGHT_PIEZAS)) +
                  Tablero.inicioTableroY),
              left: ((bloquesPuestos[i][j]!.x *
                      (Tablero.tableroWidth / Tablero.TABLERO_WIDTH_PIEZAS)) +
                  Tablero.inicioTableroX),
              child: Container(
                width: Tablero.tableroWidth / Tablero.TABLERO_WIDTH_PIEZAS,
                height: Tablero.tableroHeight / Tablero.TABLERO_HEIGHT_PIEZAS,
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
                (Tablero.tableroHeight / Tablero.TABLERO_HEIGHT_PIEZAS)) +
            Tablero.inicioTableroY),
        left: ((piezaActual.centroPieza.x *
                (Tablero.tableroWidth / Tablero.TABLERO_WIDTH_PIEZAS)) +
            Tablero.inicioTableroX),
        child: Container(
            width: Tablero.tableroWidth / Tablero.TABLERO_WIDTH_PIEZAS,
            height: Tablero.tableroHeight / Tablero.TABLERO_HEIGHT_PIEZAS,
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
      width: Tablero.piezaReservadaTextoWidth,
      height: Tablero.piezaReservadaTextoHeight,
      child: Container(
          child: const Center(child: Text("Reservada")), color: color),
    ));

    if (piezaReservada != null) {
      for (Bloque i in piezaReservada!.bloques) {
        listaBloque.add(Positioned(
            width: Tablero.piezaReservadaWidth / Tablero.REJILLA_RESERVADA,
            height: Tablero.piezaReservadaHeight / Tablero.REJILLA_RESERVADA,
            left: (i.x - 2) *
                Tablero.piezaReservadaWidth /
                Tablero.REJILLA_RESERVADA,
            top: (i.y + 3) *
                    Tablero.piezaReservadaHeight /
                    Tablero.REJILLA_RESERVADA +
                Tablero.piezaReservadaTextoHeight,
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
        width: Tablero.piezaReservadaTextoWidth,
        height: Tablero.piezaReservadaTextoHeight,
        child: Container(
          color: color,
          child: const Center(child: Text("Siguientes: ")),
        )));

    for (Bloque i in piezasSiguientes.toList()[0].bloques) {
      listaBloque.add(Positioned(
          width: Tablero.piezaReservadaWidth / Tablero.REJILLA_RESERVADA,
          height: Tablero.piezaReservadaHeight / Tablero.REJILLA_RESERVADA,
          left: (i.x - 2) *
              Tablero.piezaReservadaWidth /
              Tablero.REJILLA_RESERVADA,
          top: (i.y + 3) *
                  Tablero.piezaReservadaHeight /
                  Tablero.REJILLA_RESERVADA +
              Tablero.piezaReservadaTextoHeight,
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
          width: Tablero.piezaReservadaWidth / Tablero.REJILLA_RESERVADA,
          height: Tablero.piezaReservadaHeight / Tablero.REJILLA_RESERVADA,
          left: (i.x - 2) *
              Tablero.piezaReservadaWidth /
              Tablero.REJILLA_RESERVADA,
          top: (i.y + 3) *
                  Tablero.piezaReservadaHeight /
                  Tablero.REJILLA_RESERVADA +
              Tablero.piezaReservadaTextoHeight +
              Tablero.piezaReservadaHeight,
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
          width: Tablero.piezaReservadaWidth / Tablero.REJILLA_RESERVADA,
          height: Tablero.piezaReservadaHeight / Tablero.REJILLA_RESERVADA,
          left: (i.x - 2) *
              Tablero.piezaReservadaWidth /
              Tablero.REJILLA_RESERVADA,
          top: (i.y + 3) *
                  Tablero.piezaReservadaHeight /
                  Tablero.REJILLA_RESERVADA +
              Tablero.piezaReservadaTextoHeight +
              2 * Tablero.piezaReservadaHeight,
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

    Tablero.widthPantalla = MediaQuery.of(context).size.width;
    Tablero.heightPantalla = MediaQuery.of(context).size.height;

    Tablero.tableroWidth = 0.75 * Tablero.widthPantalla;
    Tablero.tableroHeight = 0.9 *
        (Tablero
            .heightPantalla); //- appBar.preferredSize.height); //2 * tableroWidth;

    Tablero.inicioTableroX = 3;
    Tablero.inicioTableroY = 3;

    Tablero.piezaReservadaTextoWidth = 0.23 * Tablero.widthPantalla;
    Tablero.piezaReservadaTextoHeight = 0.05 * Tablero.widthPantalla;
    Tablero.piezaReservadaWidth = 0.23 * Tablero.widthPantalla;
    Tablero.piezaReservadaHeight = 0.23 * Tablero.widthPantalla;

    return Scaffold(
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
                  height: Tablero.piezaReservadaHeight,
                  width: Tablero.piezaReservadaWidth,
                  color: Colors.grey,
                  child: Stack(children: piezaReservadaDisplay()),
                ),

                const SizedBox(
                  height: 8,
                ), //Para darle un espacio entre containers

                Container(
                    width: Tablero.piezaReservadaWidth,
                    height: 3 * Tablero.piezaReservadaHeight +
                        Tablero.piezaReservadaTextoHeight,
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
                    if (!colisionLateralPieza(true)) {
                      setState(() {
                        piezaActual.mover(1);
                      });
                    }
                  },
                  child: const Icon(Icons.arrow_back, size: 32),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!giroChoque(true)) {
                      setState(() {
                        piezaActual.girar(true);
                      });
                    }
                  },
                  child: const Icon(Icons.rotate_left, size: 32),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!piezaActual.estaEnSuelo() &&
                        !estaEncimaPieza(piezaActual) && !gameOver()) {
                      setState(() {
                        piezaActual.mover(3);
                      });
                    }
                  },
                  onLongPress: () {
                    setState(() {
                      //piezaActual.mover(3);
                      bajarRapido();
                    });
                  },
                  child: const Icon(Icons.arrow_downward, size: 32),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!giroChoque(false)) {
                      setState(() {
                        piezaActual.girar(false);
                      });
                    }
                  },
                  child: const Icon(Icons.rotate_right, size: 32),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!colisionLateralPieza(false)) {
                      setState(() {
                        piezaActual.mover(2);
                      });
                    }
                  },
                  child: const Icon(Icons.arrow_forward, size: 32),
                ),
              ],
            )),
      ],
    ));
  }
}
