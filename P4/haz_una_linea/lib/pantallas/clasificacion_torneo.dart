import 'package:flutter/material.dart';
import 'package:haz_una_linea/api/participaAPI.dart';

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
    final double width = MediaQuery.of(context).size.width;
    int contador=1;

    return FutureBuilder<PuntuacionTorneosAPI>(
        future: _futurePuntuacionTorneos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              _puntuacionesTorneo = snapshot.data!.puntuaciones;

              //Devuelve una tabla con los datos de la clasificacion
              return SizedBox(
                width: width,
                child: DataTable(
                columns: const [
                  DataColumn(label: Text("Top")),
                  DataColumn(label: Text("Nombre")),
                  DataColumn(label: Text("Fecha")),
                  DataColumn(label: Text("Score")),
                ],
                rows: _puntuacionesTorneo.map((puntuacion) => DataRow(
                  cells: [
                    DataCell(Text((contador++).toString())),
                    DataCell(Text(puntuacion.nombre)),
                    DataCell(Text("placeholder", 
                    style: TextStyle(fontSize: 10),
                    )),
                    DataCell(Text(puntuacion.puntuacion.toString())),
                  ],
                )).toList(),
              ));
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
      body: SingleChildScrollView(
        child: _getPuntuacionesTorneo(),
      ),
    );
  }
}