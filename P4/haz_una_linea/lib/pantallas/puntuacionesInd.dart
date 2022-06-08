import 'package:flutter/material.dart';
import 'package:haz_una_linea/api/juegaIndividualAPI.dart';
import 'package:haz_una_linea/parametros_tablero.dart';

class PuntuacionesInd extends StatefulWidget {
  @override
  State<PuntuacionesInd> createState() => _PuntuacionesInd();
}

class _PuntuacionesInd extends State<PuntuacionesInd> {
  Future<PuntuacionInd>? _futurePuntuacion;

  Widget getPuntuaciones() {
    final double width = MediaQuery.of(context).size.width;
    return FutureBuilder<PuntuacionInd>(
        future: _futurePuntuacion,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return SizedBox(
                width: width,
                child: DataTable(
                columns: const [
                  DataColumn(label: Text("Fecha",
                    textAlign: TextAlign.center,
                    )),

                  DataColumn(label: Text("Puntuación", textAlign: TextAlign.center,)),
                ],
                rows: snapshot.data!.puntuaciones.map((puntuacion) => DataRow(
                  cells: [
                    DataCell(Text(puntuacion.fecha.day.toString()+"/"+puntuacion.fecha.month.toString()+"/"+puntuacion.fecha.year.toString())),
                    DataCell(Text(puntuacion.puntuacion.toString())),
                  ],
                )).toList(),
              ));
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
    //print("Soy el usuario: ${ParametrosTablero.usuario!.id}");
    _futurePuntuacion=PuntuacionInd.getPuntuaciones(ParametrosTablero.usuario!.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Puntuaciones", textAlign: TextAlign.center,),
      ),
      body: SingleChildScrollView(
        child: getPuntuaciones()
      )
          //Tabla con las puntuaciones
          //child: getPuntuaciones()
      //)
    );
  }
}
