//import 'dart:html';

import 'package:flutter/material.dart';

class Tablero extends StatelessWidget {
  static double tableroWidth = 0; // = MediaQuery.of(context).size.width;
  static double tableroHeight = 0; // = 640;
  static double widthPantalla = 0;
  static double heightPantalla = 0;
  static double inicioTableroX = 0;
  static double inicioTableroY = 0;
  static const double TABLERO_WIDTH_PIEZAS = 10;
  static const double TABLERO_HEIGHT_PIEZAS = 20;

  Stack pintarTableroPiezas() {
    //Sirve para pintar el tablero junto a las piezas
    return Stack(
      //Para dibujar las piezas encima del propio tablero
      children: [
        Container(
          //El propio tablero
          margin: const EdgeInsets.all(3),
          width: tableroWidth,
          height: tableroHeight,
          color: Colors.grey,
        ),
        Positioned(
            //Ejemplo que muestra como se pinta un bloque
            top: inicioTableroX,
            left: inicioTableroY,
            child: Container(
                width: tableroWidth / TABLERO_WIDTH_PIEZAS,
                height: tableroHeight / TABLERO_HEIGHT_PIEZAS,
                color: Colors.red)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: const Text("Jueguecito del diablo"),
    );

    widthPantalla = MediaQuery.of(context).size.width;
    heightPantalla = MediaQuery.of(context).size.height;

    tableroWidth = 0.75 * widthPantalla;
    tableroHeight = 0.9 *
        (heightPantalla - appBar.preferredSize.height); //2 * tableroWidth;

    inicioTableroX = 3;
    inicioTableroY = 3;
    //tableroHeight = 0.95 * MediaQuery.of(context).size.height;
    //tableroHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: appBar,
        body: Column(
          children: [
            //Expanded(
            //Sirve para poder usar flex como si de un css se tratara
            //flex: 95,
            /*child:*/ Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,   //Sirve para ajustar verticalmente
              children: [
                pintarTableroPiezas(),
                Expanded(

                    //child: Column(
                    child: Padding(
                        //Padding para que no se pegue con el tablero
                        padding: const EdgeInsets.all(3),
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Icon(Icons.pause, size: 32),
                            ),

                            //Expanded(
                            //  flex: 3,
                            //child: Container(
                            Container(
                                height: 0.12 *
                                    (heightPantalla -
                                        appBar.preferredSize.height),
                                color: Colors.red,
                                child:
                                    const Center(child: Text("Pieza siguiente"))
                                //),
                                ),

                            const SizedBox(
                              height: 8,
                            ), //Para darle un espacio entre containers

                            //Expanded(
                            //  flex: 10,
                            //child: Container(
                            Container(
                              height: 0.36 *
                                  (heightPantalla -
                                      appBar.preferredSize.height),
                              color: Colors.yellow,
                              child: const Text("Siguientes piezas"),
                            ),

                            const SizedBox(
                              height: 8,
                            ), //Para darle un espacio entre containers

                            //Expanded(
                            //child: Column(    //???Quizas esto se pueda hacer con un grid
                            Column(
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
                            //),

                            ElevatedButton(
                                onPressed: () {}, child: const Text("Save")),
                          ],
                        ))),
              ],
              //)
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
                      onPressed: () {},
                      child: const Icon(Icons.arrow_back, size: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.rotate_left, size: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.arrow_downward, size: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.rotate_right, size: 32),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.arrow_forward, size: 32),
                    ),
                  ],
                )),
          ],
        ));
  }
}

//https://stackoverflow.com/questions/43122113/sizing-elements-to-percentage-of-screen-width-height