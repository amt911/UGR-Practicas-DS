//import 'dart:html';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haz_una_linea/bloque.dart';
import 'package:haz_una_linea/ipieza.dart';
import 'package:haz_una_linea/pieza.dart';

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
  Pieza piezaActual = IPieza();

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

  void comenzar() {
    timerPrincipal =
        Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      //El 3

      setState(() {
          piezaActual.mover(3);
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
                                child:
                                    const Center(child: Text("Pieza siguiente"))
                                ),

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
                        setState(() {
                          piezaActual.mover(1);
                        });
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

                      onLongPress: (){
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
                        setState(() {
                          piezaActual.mover(2);  
                        });
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