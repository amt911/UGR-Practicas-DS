import 'package:flutter/material.dart';
import 'package:haz_una_linea/api/torneoAPI.dart';
import 'package:haz_una_linea/tablero.dart';

class TorneoPantalla extends StatefulWidget {
  final int idTorneo;

  const TorneoPantalla({Key? key, required this.idTorneo}) : super(key: key);

  @override
  State<TorneoPantalla> createState() => _TorneoPantallaState();
}

class _TorneoPantallaState extends State<TorneoPantalla> {
  Future<Torneo>? _futureTorneo;
  Widget getInfo() {
    return FutureBuilder<Torneo>(
        future: _futureTorneo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              //if (_menuItem == 4) {
              //  _idController.text = snapshot.data!.id.toString();
              //}
              //return Text(snapshot.data.toString());

              return Column(children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(snapshot.data!.nombre),
                      Text(snapshot.data!.descripcion),
                    ],
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Text(snapshot.data!.fecha_max_juego.toString()),
                ),
                ElevatedButton(
                    child: const Text("Jugar torneo"),
                    onPressed: () {
                      //Navigator.pop(context);

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tablero(snapshot.data!.piezasPuestas)));                      
                    }),
              ]);
/*
Column(children: [
          Expanded(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Torneo ${widget.idTorneo}'),
                const Text("Una descripción potente para el torneo"),
              ],
            ),
          ),
          Container(
            color: Colors.green,
            child: Text('Torneo ${widget.idTorneo}'),
          ),
          ElevatedButton(
            child: const Text("Jugar torneo"),
            onPressed: () {
              //Navigator.pop(context);
            },
          ),
*/

            } else {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
          }
          return const CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    _futureTorneo = Torneo.getTorneo(widget.idTorneo.toString());
    getInfo();
    return Scaffold(
        appBar: AppBar(
          title: Text('Torneo ${widget.idTorneo}'),
        ),
        body: Center(child: getInfo()));
  }
}
