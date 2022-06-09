import 'package:flutter/material.dart';
import 'package:haz_una_linea/api/usuarioAPI.dart';

import '../parametros_tablero.dart';

class FormularioInicioSesion extends StatefulWidget {
  @override
  State<FormularioInicioSesion> createState() => _FormularioInicioSesionState();
}

class _FormularioInicioSesionState extends State<FormularioInicioSesion> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  Future<Usuario>? _futureUsuario;
  bool _idEntered = false;

  Widget checkUsuario() {
    return FutureBuilder<Usuario>(
        future: _futureUsuario,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (snapshot.data!.contrasena == _contrasenaController.text) {
                ParametrosTablero.sesionIniciada = true;
                ParametrosTablero.usuario = snapshot.data;
                Future.microtask(() => Navigator.pop(context));
              } else {
                return const Text("Contraseña incorrecta");
              }
              return Text(snapshot.data.toString());
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
            }
          }
          return const CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio de sesión"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(
                labelText: "Nombre",
              ),
            ),
            //Oculta la contraseña
            TextField(
              controller: _contrasenaController,
              decoration: const InputDecoration(
                labelText: "Contraseña",
              ),
              obscureText: true,
            ),
            ElevatedButton(
              child: const Text("Iniciar sesión"),
              onPressed: () {
                setState(() {
                  _futureUsuario = Usuario.getUsuario(_nombreController.text);
                  _idEntered = true;
                });
              },
            ),
            if (_idEntered) checkUsuario(),
          ],
        ),
      ),
    );
  }
}
