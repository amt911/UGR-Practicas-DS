import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Creditos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Créditos")),
        ),
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
              Text(
                "Grupo 7 - A1",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Text("Andrés Merlo Trujillo",
              style: TextStyle(fontSize: 40),),
              Text("Javier Serrano Lucas",
              style: TextStyle(fontSize: 40),),
              Text("Sergio Hervás Cobo",
              style: TextStyle(fontSize: 40),),
              Text("Ricardo Molina Rodríguez",
              style: TextStyle(fontSize: 35),)              
            ])));
  }
}
