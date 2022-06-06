import 'package:flutter/material.dart';
import 'package:haz_una_linea/api/participaAPI.dart';
import 'package:haz_una_linea/api/torneoAPI.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/tablero.dart';

class TorneoPantalla extends StatefulWidget {
  final int idTorneo;

  const TorneoPantalla({Key? key, required this.idTorneo}) : super(key: key);

  @override
  State<TorneoPantalla> createState() => _TorneoPantallaState();
}

class _TorneoPantallaState extends State<TorneoPantalla> {
  Future<Torneo>? _futureTorneo;
  Future<PuntuacionTorneosAPI>? _futurePuntuacionTorneos;
  List<PuntuacionTorneo>? _puntuacionesTorneo =[];

  void _cargarPuntuacionesTorneo() {
    FutureBuilder<PuntuacionTorneosAPI>(
        future: _futurePuntuacionTorneos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done){
            if (snapshot.hasData) {
              _puntuacionesTorneo = snapshot.data!.puntuaciones;
              //return _crearListaPuntuacionesTorneo();
            }
            else {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
        }
          return const CircularProgressIndicator();
        });
  }

  Widget _getInfo() {
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
                if(!DateTime.now().isAfter(snapshot.data!.fecha_max_juego))
                ElevatedButton(
                    child: const Text("Jugar torneo"),
                    onPressed: () {
                      //Navigator.pop(context);
                      int esBomba = snapshot.data!.esBomba ? 1 : 0;
                      ParametrosTablero.t = esBomba;
                      ParametrosTablero.probabilidad =
                          snapshot.data!.probabilidad;
                      ParametrosTablero.esTorneo=true;
                      ParametrosTablero.idTorneo=snapshot.data!.id;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Tablero(snapshot.data!.piezasPuestas)));
                    }),
                
                //Si existe un registro con el id del usuario en snapshot, se muestra
                //if(_puntuacionesTorneo!=null && _puntuacionesTorneo!.indexWhere((i) => i.usuario_id==ParametrosTablero.usuario!.id)!=-1)
                ElevatedButton(
                    child: const Text("Mostrar clasificación"),
                    onPressed: () {
                      //Navigator.push(
                      //    context,
                      //    MaterialPageRoute(
                      //        builder: (context) =>
                      //            Tablero(snapshot.data!.piezasPuestas)));
                    }),
              ]);
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
    _futureTorneo = Torneo.getTorneo(widget.idTorneo);
    _futurePuntuacionTorneos = PuntuacionTorneosAPI.getPuntuaciones(widget.idTorneo);
    //_getInfo();
    _cargarPuntuacionesTorneo();

    print("Puntuaciones: " + _puntuacionesTorneo.toString());
    print("ID: ${widget.idTorneo}");
    return Scaffold(
        appBar: AppBar(
          title: Text('Torneo ${widget.idTorneo}'),
        ),
        body: Center(child: _getInfo()));
  }
}
