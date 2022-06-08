import 'package:flutter/material.dart';
import 'package:haz_una_linea/api/participaAPI.dart';
import 'package:haz_una_linea/api/torneoAPI.dart';
import 'package:haz_una_linea/pantallas/clasificacion_torneo.dart';
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

  Widget _getInfo() {
    final double width = MediaQuery.of(context).size.width;
    return FutureBuilder<Torneo>(
        future: _futureTorneo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(children: [
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(snapshot.data!.nombre, 
                        style: const TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,

                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: SizedBox(
                          width: width,
                          child: Card(
                        child: Column(
                          children: [
                        const Text("Descripción",
                        style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      //Padding(padding: const EdgeInsets.all(10),
                      Expanded(
                      child: SingleChildScrollView(
                        child: Text(snapshot.data!.descripcion,
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.justify,
                        ))),
                          ],
                        ))))
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text("Fecha máxima de juego: ${snapshot.data!.fecha_max_juego.day}/${snapshot.data!.fecha_max_juego.month}/${snapshot.data!.fecha_max_juego.year}"),
                      const SizedBox(height: 10),
                      //Text("asdasd: ${snapshot.data!.esBomba}"),
                      Text("Modo bomba: "+(snapshot.data!.esBomba?"Sí":"No")),
                      const SizedBox(height: 10),
                      if(snapshot.data!.esBomba)
                        Text("Probabilidad de bomba: ${snapshot.data!.probabilidad}"),
                      if(snapshot.data!.esBomba)
                        const SizedBox(height: 10),
                      
                      Text("Velocidad: x${snapshot.data!.multiplier}"),
                      const SizedBox(height: 10),

                      Text("Bloques iniciales: ${snapshot.data!.piezasPuestas}"),
                      const SizedBox(height: 10),
                    ],
                ))),
                  ),
              
                if(!(_puntuacionesTorneo!=null && _puntuacionesTorneo!.indexWhere((i) => i.usuario_id==ParametrosTablero.usuario!.id)!=-1) && !DateTime.now().isAfter(snapshot.data!.fecha_max_juego))
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
                                  Tablero(snapshot.data!.piezasPuestas, snapshot.data!.multiplier)));
                    }),
                
                //Si existe un registro con el id del usuario en snapshot, se muestra
                if(_puntuacionesTorneo!=null && _puntuacionesTorneo!.indexWhere((i) => i.usuario_id==ParametrosTablero.usuario!.id)!=-1)
                ElevatedButton(
                    child: const Text("Mostrar clasificación"),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ClasificacionTorneo(widget.idTorneo)));
                    }),
                //Text(_puntuacionesTorneo.toString()),
                //Text(_puntuacionesTorneo!.indexWhere((i) => i.usuario_id==ParametrosTablero.usuario!.id).toString()),
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
  void initState() {
    _futureTorneo = Torneo.getTorneo(widget.idTorneo);
    _futurePuntuacionTorneos = PuntuacionTorneosAPI.getPuntuaciones(widget.idTorneo);
    _futurePuntuacionTorneos!.then((value) => setState((){_puntuacionesTorneo = value.puntuaciones;}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Torneo ${widget.idTorneo}'),
        ),
        body: Center(
          child: _getInfo()));
  }
}
