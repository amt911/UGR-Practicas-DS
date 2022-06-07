import 'package:flutter/material.dart';
import 'package:haz_una_linea/api/participaAPI.dart';
import 'package:haz_una_linea/pantallas/puntuacionesInd.dart';

class ClasificacionTorneo extends StatefulWidget {
  final int idTorneo;

  ClasificacionTorneo(this.idTorneo);

  @override
  State<ClasificacionTorneo> createState() => _ClasificacionTorneo();
}

class _ClasificacionTorneo extends State<ClasificacionTorneo> {
  Future<PuntuacionTorneosAPI>? _futurePuntuacionTorneos;
  List<PuntuacionTorneo> _puntuacionesTorneo=[];

  Widget _getPuntuacionesTorneo(){
    return FutureBuilder<PuntuacionTorneosAPI>(
        future: _futurePuntuacionTorneos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              _puntuacionesTorneo = snapshot.data!.puntuaciones;

              //Devuelve una tabla con los datos de la clasificacion
              return DataTable(
                columns: const [
                  DataColumn(label: Text("Nombre")),
                  DataColumn(label: Text("Puntuación")),
                ],
                rows: _puntuacionesTorneo.map((puntuacion) => DataRow(
                  cells: [
                    DataCell(Text(puntuacion.nombre)),
                    DataCell(Text(puntuacion.puntuacion.toString())),
                  ],
                )).toList(),
              );
            } else {
              return const Text("No hay puntuaciones");
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  Widget build(BuildContext context) {
    _futurePuntuacionTorneos = PuntuacionTorneosAPI.getPuntuaciones(widget.idTorneo);
    return Scaffold(
      appBar: AppBar(
        title: Text("Clasificación"),
      ),
      body: Center(
        child: _getPuntuacionesTorneo(),
      ),
    );
  }
}