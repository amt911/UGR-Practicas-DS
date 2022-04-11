import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Game Over perro")),
        body: const Center(
          child: Text("GAME OVER PERRO"),
        ));
  }
}
