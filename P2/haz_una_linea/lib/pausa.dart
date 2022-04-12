import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haz_una_linea/Musica.dart';
import 'package:haz_una_linea/tablero.dart';

class Pausa extends StatefulWidget {
  Musica m;

  Pausa(this.m);

  @override
  State<Pausa> createState() => _Pausa();
}

class _Pausa extends State<Pausa> {
//  bool apagado = true;
//  IconData icono = Icons.volume_up;

  //_Pausa(this.m);

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
                      widget.m.reanudarMusica();
                    },
                    child: const Text("Reanudar la partida")),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton.icon(
                    icon: Icon(widget.m.icono, size: 32),
                    onPressed: () {
                      widget.m.setSonido();
                      setState(() {                        
                        if (!widget.m.apagado) {
                          widget.m.icono = Icons.volume_up;
                          widget.m.apagado = true;
                        } else {
                          widget.m.icono = Icons.volume_off;
                          widget.m.apagado = false;
                        }
                      });
                    },
                    label: const Text("Sonido On/Off")),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text("Salir de la partida")),
              )
            ],
          ),
        )
      ],
    ));
  }
}
