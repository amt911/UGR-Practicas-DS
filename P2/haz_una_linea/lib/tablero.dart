//import 'dart:html';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/cubopieza.dart';
import 'package:haz_una_linea/factoria_abstracta.dart';
import 'package:haz_una_linea/factoria_concreta.dart';
import 'package:haz_una_linea/ipieza.dart';
import 'package:haz_una_linea/lpieza.dart';
import 'package:haz_una_linea/pieza.dart';
import 'package:haz_una_linea/spieza.dart';
import 'package:haz_una_linea/tpieza.dart';

class Tablero extends StatefulWidget {
  static double tableroWidth = 0; // = MediaQuery.of(context).size.width;
  static double tableroHeight = 0; // = 640;
  static double widthPantalla = 0;
  static double heightPantalla = 0;
  static double inicioTableroX = 0;
  static double inicioTableroY = 0;
  static const double TABLERO_WIDTH_PIEZAS = 10;
  static const double TABLERO_HEIGHT_PIEZAS = 20;

  @override
  State<Tablero> createState() => _Tablero();
}

class _Tablero extends State<Tablero> {
  Timer? timerPrincipal;
  late Pieza piezaActual;
  List<Pieza> lista = [
    IPieza(),
    LPieza(true),
    LPieza(false),
    SPieza(true),
    SPieza(false),
    CuboPieza(),
    TPieza()
  ];
  late FactoriaAbstracta fa;
  late List<List<Bloque?>> bloquesPuestos;
  //bool parar = false;   //Solamente sirve para parar las piezas y depurarlas

  _Tablero() : super() {
    bloquesPuestos = List.generate(
        Tablero.TABLERO_HEIGHT_PIEZAS.toInt(),
        (index) => List.filled(Tablero.TABLERO_WIDTH_PIEZAS.toInt(), null,
            growable: false),
        growable: false);

    fa = FactoriaConcreta(lista);
    piezaActual = fa.crearPieza();
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
    for (Bloque aux in piezaActual.bloques) {
      bloquesPuestos[aux.y.toInt()][aux.x.toInt()] = aux;
    }
  }

  bool estaEncimaPieza() {
    bool res = false;
    for (Bloque aux in piezaActual.bloques) {
      if (bloquesPuestos[(aux.y + 1).toInt()][aux.x.toInt()] != null) {
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
            (bloquesPuestos[aux.y.toInt()][(aux.x - 1).toInt()] != null)) {
          res = true;
        }

        //if ((aux.x < (Tablero.TABLERO_WIDTH_PIEZAS - 1)) &&
        //    (bloquesPuestos[aux.y.toInt()][(aux.x + 1).toInt()] != null)) {
        //  res = true;
        //}
      }
    }
    else{
      for (Bloque aux in piezaActual.bloques) {
        //if ((aux.x > 0) &&
        //    (bloquesPuestos[aux.y.toInt()][(aux.x - 1).toInt()] != null)) {
        //  res = true;
        //}

        if ((aux.x < (Tablero.TABLERO_WIDTH_PIEZAS - 1)) &&
            (bloquesPuestos[aux.y.toInt()][(aux.x + 1).toInt()] != null)) {
          res = true;
        }
      }      
    }

    return res;
  }

  void comenzar() {
    timerPrincipal =
        Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        //if (!parar) {
        //parar = true;
        //for (int i = 0; i < 10; i++)

        if (!piezaActual.estaEnSuelo() && !estaEncimaPieza()) {
          piezaActual.mover(3); //PASAR EL MOVIMIENTO A ENUMERADO???
        } else {
          //print("HE ENTRADOLSDJKFLSDKFJLDFKGJLDKFGJDFG\n");
          //Si esta en el suelo se genera una nueva pieza
          meterEnTablero();
          piezaActual = fa.crearPieza();
        }
        //}
      });
    });
  }

  Stack pintarTableroPiezas() {
    //Primero se crea una lista con los bloques de la pieza actual
    List<Widget>? bloquesActivos = List.empty(growable: true);

    bloquesActivos.add(Container(
      //El propio tablero
      margin: const EdgeInsets.all(3),
      width: Tablero.tableroWidth,
      height: Tablero.tableroHeight,
      color: Colors.grey,
    ));

    for (Bloque aux in piezaActual.bloques) {
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
              color: aux.color)));
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
                  color: bloquesPuestos[i][j]!.color)));
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

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: const Text("Jueguecito del diablo"),
    );

    Tablero.widthPantalla = MediaQuery.of(context).size.width;
    Tablero.heightPantalla = MediaQuery.of(context).size.height;

    Tablero.tableroWidth = 0.75 * Tablero.widthPantalla;
    Tablero.tableroHeight = 0.9 *
        (Tablero.heightPantalla -
            appBar.preferredSize.height); //2 * tableroWidth;

    Tablero.inicioTableroX = 3;
    Tablero.inicioTableroY = 3;
    //tableroHeight = 0.95 * MediaQuery.of(context).size.height;
    //tableroHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: appBar,
        body: Column(
          children: [
            Row(
              children: [
                pintarTableroPiezas(),
                Expanded(
                    child: Padding(
                        //Padding para que no se pegue con el tablero
                        padding: const EdgeInsets.all(3),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Icon(Icons.pause, size: 32),
                            ),

                            Container(
                                height: 0.12 *
                                    (Tablero.heightPantalla -
                                        appBar.preferredSize.height),
                                color: Colors.red,
                                child: const Center(
                                    child: Text("Pieza siguiente"))),

                            const SizedBox(
                              height: 8,
                            ), //Para darle un espacio entre containers

                            Container(
                              height: 0.36 *
                                  (Tablero.heightPantalla -
                                      appBar.preferredSize.height),
                              color: Colors.yellow,
                              child: const Text("Siguientes piezas"),
                            ),

                            const SizedBox(
                              height: 8,
                            ), //Para darle un espacio entre containers

                            Column(
                              //???Quizas esto se pueda hacer con un grid
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                    color: Colors.amber,
                                    child: const Text("Score: ")),
                                Container(
                                    color: Colors.amber,
                                    child: const Text("Level: ")),
                                Container(
                                    color: Colors.amber,
                                    child: const Text("Lines: ")),
                              ],
                            ),

                            ElevatedButton(
                                onPressed: () {}, child: const Text("Save")),
                          ],
                        ))),
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
                        setState(() {
                          piezaActual.girar(true);
                        });
                      },
                      child: const Icon(Icons.rotate_left, size: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          piezaActual.mover(3);
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          piezaActual.mover(3);
                        });
                      },
                      child: const Icon(Icons.arrow_downward, size: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          piezaActual.girar(false);
                        });
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

//https://stackoverflow.com/questions/43122113/sizing-elements-to-percentage-of-screen-width-height