import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haz_una_linea/creditos.dart';
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
                child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Tablero(0)));
                      },
                      icon: const Icon(Icons.play_arrow_rounded, size: 18),
                      label: const Text("Partida normal"),
                    ))),
            Expanded(
                child: Align(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Tablero(1)));
                      },
                      icon: const Icon(Icons.play_arrow_rounded, size: 18),
                      label: const Text("Partida con bombas"),
                    ))),
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
