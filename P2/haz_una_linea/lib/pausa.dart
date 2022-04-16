import 'package:flutter/material.dart';
import 'package:haz_una_linea/musica.dart';

class Pausa extends StatefulWidget {
  final Musica m;

  // ignore: use_key_in_widget_constructors
  const Pausa(this.m);

  @override
  State<Pausa> createState() => _Pausa();
}

class _Pausa extends State<Pausa> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          widget.m.reanudarMusica();

          return true;
        },
        child: Scaffold(
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
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        child: const Text("Salir de la partida")),
                  )
                ],
              ),
            )
          ],
        )));
  }
}
