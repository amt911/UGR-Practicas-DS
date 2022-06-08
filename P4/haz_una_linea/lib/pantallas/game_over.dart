import 'package:flutter/material.dart';
import 'package:haz_una_linea/api/participaAPI.dart';
import 'package:haz_una_linea/pantallas/clasificacion_torneo.dart';
import 'package:haz_una_linea/parametros_tablero.dart';

import '../api/juegaIndividualAPI.dart';

class GameOver extends StatelessWidget {
  final int puntuacion, nivel, lineas;
  Future<PuntuacionInd>? _p;
  Future<PuntuacionTorneosAPI>? _pTorneos;

  // ignore: use_key_in_widget_constructors
  GameOver(this.puntuacion, this.nivel, this.lineas);

  @override
  Widget build(BuildContext context) {
    if(ParametrosTablero.sesionIniciada && !ParametrosTablero.esTorneo) {
      _p = PuntuacionInd.createPuntuacion(ParametrosTablero.usuario!.id, puntuacion);
    }
    else if(ParametrosTablero.sesionIniciada && ParametrosTablero.esTorneo) {
      //_p = PuntuacionTorneo.createPuntuacion(ParametrosTablero.usuario!.id, puntuacion);
      //Incluir la puntuacion del torneo aqui
      _pTorneos = PuntuacionTorneosAPI.createPuntuacion(ParametrosTablero.usuario!.id, puntuacion, ParametrosTablero.idTorneo);
    }
    
    return Scaffold(
        //backgroundColor: const Color.fromARGB(255, 73, 73, 73),
        body: Column(
          children: [
            const Text(
              "GAME OVER",
              style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 22,),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Puntuación: $puntuacion",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )
            ),
                Text("Líneas realizadas: $lineas",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  )
                ),

                Text("Nivel alcanzado: $nivel",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,                
                  )
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if(ParametrosTablero.sesionIniciada && ParametrosTablero.esTorneo)
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          ParametrosTablero.esTorneo = false;
                          int idT = ParametrosTablero.idTorneo;
                          ParametrosTablero.idTorneo=-1;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ClasificacionTorneo(idT)),
                          );
                        },
                        child: const Text("Mostrar clasificación")),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          ParametrosTablero.esTorneo = false;
                          ParametrosTablero.idTorneo=-1;
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                        },
                        child: const Text("Salir de la partida")),
                  ),                            
                ],
              ),
            )
          ],
        ));
  }
}
