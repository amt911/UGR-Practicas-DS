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
    return FutureBuilder<PuntuacionInd>(
        future: _futurePuntuacion,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Table(
                children: [
                  const TableRow(
                    children: [
                      Text("Nombre"),
                      Text("Puntuación"),
                    ],
                  ),
                  for (Puntuacion puntuacion in snapshot.data!.puntuaciones)
                    TableRow(
                      children: [
                        Text(puntuacion.fecha.toString()),
                        Text(puntuacion.puntuacion.toString()),
                      ],
                    ),
                ],
              );
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
    print("Soy el usuario: ${ParametrosTablero.usuario!.id}");
    _futurePuntuacion=PuntuacionInd.getPuntuaciones(ParametrosTablero.usuario!.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Puntuaciones"),
      ),
      body: Center(
          //Tabla con las puntuaciones
          child: getPuntuaciones()
      )
    );
  }
}
