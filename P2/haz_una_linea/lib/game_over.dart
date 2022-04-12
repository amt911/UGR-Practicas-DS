import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  int puntuacion, nivel, lineas;

  GameOver(this.puntuacion, this.nivel, this.lineas);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 73, 73, 73),
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )
            ),
                Text("Líneas realizadas: $lineas",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  )
                ),

                Text("Nivel alcanzado: $nivel",
                style: const TextStyle(
                  color: Colors.white,
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
        ));
  }
}
