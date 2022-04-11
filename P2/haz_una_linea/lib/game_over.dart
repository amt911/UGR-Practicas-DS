import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 73, 73, 73),
        body: Column(
      children: [
          const Text("GAME OVER",
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.red),
              textAlign: TextAlign.center,
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
                    child: const Text("Salir de la partida")
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
