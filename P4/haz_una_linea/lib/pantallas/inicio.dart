import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haz_una_linea/pantallas/creditos.dart';
import 'package:haz_una_linea/pantallas/torneos.dart';
import 'package:haz_una_linea/parametros_tablero.dart';
import 'package:haz_una_linea/tablero.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haz una linea',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark, primarySwatch: Colors.blueGrey),
      themeMode: ThemeMode.system,
      home: Inicio(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
        appBar: AppBar(
            title: const Center(
          child: Text("Página principal"),
        )),
        body: Column(
          children: [
            Image.asset("assets/images/LOGO.png"),

            //Container(
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      ParametrosTablero.t = 0;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tablero(12)));
                    },
                    icon: const Icon(Icons.play_arrow_rounded, size: 18),
                    label: const Text("Partida normal"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      ParametrosTablero.t = 1;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tablero(22)));
                    },
                    icon: const Icon(Icons.play_arrow_rounded, size: 18),
                    label: const Text("Partida con bombas y pieza +"),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Torneos()));
                      },
                      icon: const Icon(Icons.density_small_rounded, size: 18),
                      label: const Text("Torneos")),
                ])),

            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Creditos()));
                },
                icon: const Icon(Icons.density_small_rounded, size: 18),
                label: const Text("Inicio de sesión")),

            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Creditos()));
                },
                icon: const Icon(Icons.density_small_rounded, size: 18),
                label: const Text("Créditos"))
          ],
        ));
  }
}
