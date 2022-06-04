import 'package:flutter/material.dart';
import 'package:haz_una_linea/api/torneo.dart';

class Torneos extends StatefulWidget {
  const Torneos({Key? key}) : super(key: key);

  @override
  State<Torneos> createState() => _Torneos();
}

class _Torneos extends State<Torneos> {
  Future<Torneo>? _futureTorneos;
  final int _menuItem = 4;
  final TextEditingController _idController = TextEditingController();
  void actualizarTorneos() {
    setState(() {
      _futureTorneos = Torneo.getTorneo("1");
    });
  }

  @override
  Widget build(BuildContext context) {
    actualizarTorneos();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Torneos"),
        ),
        //Mostrar los nombres de torneos
        /*
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Torneos(),
                ),
              );
            },
          ),
        ],*/
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        FutureBuilder<Torneo>(
            future: _futureTorneos,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  if (_menuItem == 4) {
                    _idController.text = snapshot.data!.id.toString();
                  }
                  return Text(snapshot.data.toString());
                } else {
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                }
              }
              return const CircularProgressIndicator();
            })
      ])),
    );
  }
}
