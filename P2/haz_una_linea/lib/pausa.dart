import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haz_una_linea/tablero.dart';

class Pausa extends StatelessWidget {
  //Timer timer;

  //Pausa(this.timer);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Center(
          child: Text("PAUSA",
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Reanudar la partida")
                ),
              ),

              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Sonido On/Off")),
              ),

              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .popUntil((route) => route.isFirst);
                    },
                    child: const Text("Salir de la partida")
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
