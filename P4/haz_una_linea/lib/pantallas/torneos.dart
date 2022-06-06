import 'package:flutter/material.dart';
import 'package:haz_una_linea/api/torneoAPI.dart';
import 'package:haz_una_linea/api/torneosAPI.dart';
import 'package:haz_una_linea/pantallas/torneoPantalla.dart';

class Torneos extends StatefulWidget {
  const Torneos({Key? key}) : super(key: key);

  @override
  State<Torneos> createState() => _Torneos();
}

class _Torneos extends State<Torneos> {
  Future<TorneosAPI>? _futureTorneos;
  final int _menuItem = 4;
  final TextEditingController _idController = TextEditingController();
  void actualizarTorneos() {
    setState(() {
      _futureTorneos = TorneosAPI.getTorneos();
    });
  }

  Widget getTorneos() {
    return FutureBuilder<TorneosAPI>(
        future: _futureTorneos,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              if (_menuItem == 4) {
                _idController.text = snapshot.data!.toString();
              }
              //return Text(snapshot.data.toString());
              //_torneos = snapshot.data as List<Torneo>?;
              Column c = Column(
                children: [
                  for (Torneo torneo in snapshot.data!.torneos)
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            //Navigator.pushNamed(context, '/torneo', arguments: torneo);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TorneoPantalla(
                                          idTorneo: torneo.id,
                                        )));
                          },
                          child: (DateTime.now().isAfter(torneo.fecha_max_juego))
                              ? Container(
                              color: Colors.red,
                              child: Column(
                                children: [
                                  Text(torneo.nombre),
                                  Row(children: [
                                    //Text(torneo.fecha_inscripcion.toString()),
                                    Text(torneo.fecha_max_juego.toString()),
                                  ])
                                ],
                              ))
                              : Container(
                              color: Colors.green,
                              child: Column(
                                children: [
                                  Text(torneo.nombre),
                                  Row(children: [
                                    //Text(torneo.fecha_inscripcion.toString()),
                                    Text(torneo.fecha_max_juego.toString()),
                                  ])
                                ],
                              )),

                        
                          //if(DateTime.now().isAfter(torneo.fecha_max_juego))
                          
                          //if(!DateTime.now().isAfter(torneo.fecha_max_juego))
                          /*child: Container(
                              color: Colors.green,
                              child: Column(
                                children: [
                                  Text(torneo.nombre),
                                  Row(children: [
                                    //Text(torneo.fecha_inscripcion.toString()),
                                    Text(torneo.fecha_max_juego.toString()),
                                  ])
                                ],
                              )),*/
                        )),

                  //Text(torneo.toString())
                ],
              );

              return c;
            } else {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
          }
          return const CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    actualizarTorneos();
    getTorneos();
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
      /*
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
      */
      body: Center(
          child: /*Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: //[
          
        FutureBuilder<TorneosAPI>(
            future: _futureTorneos,
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  if (_menuItem == 4) {
                    _idController.text = snapshot.data!.toString();
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
            */
              getTorneos() /*]*/),
    );
  }
}
