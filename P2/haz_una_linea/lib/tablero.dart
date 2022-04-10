import 'package:flutter/material.dart';

class Tablero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text("Jueguecito del diablo"),
        ),
        body: Column(
          children: [
            Expanded( //Sirve para poder usar flex como si de un css se tratara
              flex: 90,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,   //Sirve para ajustar verticalmente
                children: [
                  Expanded(
                    flex: 80,
                    child: Container(
                      color: Colors.orange,
                      child: const Center(child: Text("Donde caen las piezas"))
                      )
                  ),
                  Expanded(
                    flex: 20,
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [                     
                        ElevatedButton(
                          onPressed: () {
                          },
                          child: const Icon(Icons.pause, size: 32),
                        ),  

                        Expanded(
                          flex: 3,
                          child: Container(
                          //Container(
                            color: Colors.red,
                            child: const Center(child: Text("Pieza siguiente"))
                          )
                        ),                

                        const SizedBox(height: 20,),  //Para darle un espacio entre containers

                        Expanded(
                          flex: 10,
                          child: Container(
                            color: Colors.yellow,
                            child: const Text("Siguientes piezas"),
                          )
                        ),

                        const SizedBox(height: 20,),  //Para darle un espacio entre containers

                        Expanded(
                          flex: 10,
                          child: Container(color: Colors.green, child: Text("Texto"))
                        ),

                        ElevatedButton(
                          onPressed: () {
                          },
                          child: const Text("Save")
                        ),                         
                      ],
                    )
                  ),                  
                ],
                )
            ),
            Expanded(
              flex: 10,
              child: Row(
                mainAxisSize: MainAxisSize.max,   //Para que se centre
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Para que se dejen un espacio uniforme
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                
                children: [
                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Icon(Icons.arrow_back, size: 32),
                  ),

                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Icon(Icons.rotate_left, size: 32),
                  ),

                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Icon(Icons.arrow_downward, size: 32),
                  ),

                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Icon(Icons.rotate_right, size: 32),
                  ),

                  ElevatedButton(
                    onPressed: () {
                    },
                    child: const Icon(Icons.arrow_forward, size: 32),
                  ),
                ],
                )
            )
          ],
        )
        );
  }
}

//https://stackoverflow.com/questions/43122113/sizing-elements-to-percentage-of-screen-width-height