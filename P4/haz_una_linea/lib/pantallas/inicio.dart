import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haz_una_linea/pantallas/creditos.dart';
import 'package:haz_una_linea/pantallas/formulario_inicio_sesion.dart';
import 'package:haz_una_linea/pantallas/puntuacionesInd.dart';
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
      home: const Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _Inicio();
}

// ignore: use_key_in_widget_constructors
class _Inicio extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
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
                child: SizedBox(
                  width: width*0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      ParametrosTablero.t = 0;
                      ParametrosTablero.probabilidad = 0.1;
                      ParametrosTablero.esTorneo=false;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tablero(0, 1)));
                    },
                    icon: const Icon(Icons.play_arrow_rounded, size: 18),
                    label: const Text("Partida normal"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      ParametrosTablero.t = 1;
                      ParametrosTablero.probabilidad = 0.1;
                      ParametrosTablero.esTorneo=false;
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tablero(0, 1)));
                    },
                    icon: const Icon(Icons.play_arrow_rounded, size: 18),
                    label: const Text("Partida con bombas y pieza +"),
                  ),
                  
                  if (ParametrosTablero.sesionIniciada)
                    ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 132, 122, 29)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PuntuacionesInd()));
                        },
                        icon: const Icon(Icons.emoji_events, size: 18),
                        label: const Text("Puntuaciones")),

                  if (ParametrosTablero.sesionIniciada)
                    ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.deepPurpleAccent),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Torneos()));
                        },
                        icon: const Icon(Icons.density_small_rounded, size: 18),
                        label: const Text("Torneos")),                        
                ]))),

            if (ParametrosTablero.sesionIniciada)
              SizedBox(
                width: width*0.4,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  onPressed: () {
                    ParametrosTablero.sesionIniciada = false;
                    ParametrosTablero.usuario = null;

                    setState(() {});
                  },
                  icon: const Icon(Icons.logout, size: 18),
                  label: const Text("Cerrar sesión"))),

            if (!ParametrosTablero.sesionIniciada)

              SizedBox(
                width: width*0.4,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormularioInicioSesion()))
                        .then((value) => setState(() {}));
                  },
                  icon: const Icon(Icons.login, size: 18),
                  label: const Text("Inicio de sesión"))),

            SizedBox(
              width: width*0.4,
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Creditos()));
                },
                icon: const Icon(Icons.density_small_rounded, size: 18),
                label: const Text("Créditos")))
          ],
        ));
  }
}