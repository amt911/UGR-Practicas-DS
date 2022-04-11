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
          child: Text("PAUSA"),
        ),
        Expanded(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);

                    Timer(const Duration(seconds: 1), () {
                      
                    });
                    
                    
                  },
                  child: const Text("Reaundar la partida")),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Placeholder 1")),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Placeholder 2")),
            ],
          ),
        )
      ],
    ));
  }
}
