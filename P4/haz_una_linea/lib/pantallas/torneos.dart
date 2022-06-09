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
  //final int _menuItem = 4;
  //final TextEditingController _idController = TextEditingController();
  void actualizarTorneos() {
    setState(() {
      _futureTorneos = TorneosAPI.getTorneos();
    });
  }

  Widget getTorneos() {
    return FutureBuilder<TorneosAPI>(
        future: _futureTorneos,
        builder: (context, snapshot) {
          //print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              //if (_menuItem == 4) {
              //  _idController.text = snapshot.data!.toString();
              //}
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
                              ? 
                              SizedBox(
                              width: double.infinity,
                              child: Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          //Borde redondeado
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                            ),
                                            color: Colors.redAccent,
                                            ),
                                          
                                          padding: const EdgeInsets.all(10),
                                          width: double.infinity,
                                          //color: Colors.blueAccent,
                                          child: Text(
                                            torneo.nombre,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold),
                                        )),
                                        Container(
                                          decoration: BoxDecoration(
                                          color: (MediaQuery.of(context).platformBrightness == Brightness.dark)?  const Color.fromARGB(255, 133, 17, 17): const Color.fromARGB(255, 255, 168, 168),
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4),
                                            ),
                                            ),                        
                                          
                                            padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  
                                                  const Text("Fecha",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold)),
                                                  Container(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Text(torneo.fecha_max_juego.day.toString()+"/"+torneo.fecha_max_juego.month.toString()+"/"+torneo.fecha_max_juego.year.toString())
                                                  )
                                                ]
                                              ),
                                              Column(
                                                children: [
                                                  
                                                  const Text("Jugadores",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold)),
                                                  Container(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Text(torneo.jugadores.toString())
                                                  )
                                                ]
                                              )                                              
                                            ],)
                                        ),
                                      ],
                                    )
                                    ))
                              : SizedBox(
                              width: double.infinity,
                              child: Card(
                                    child: Column(
                                      children: [
                                        Container(
                                          //Borde redondeado
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                            ),
                                            color: Colors.blueAccent,
                                            ),
                                          
                                          padding: const EdgeInsets.all(10),
                                          width: double.infinity,
                                          //color: Colors.blueAccent,
                                          child: Text(
                                            torneo.nombre,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontSize: 32,
                                                fontWeight: FontWeight.bold),
                                        )),
                                        Container(
                                          decoration: BoxDecoration(
                                          color: (MediaQuery.of(context).platformBrightness == Brightness.dark)? const Color.fromARGB(255, 61, 61, 61) : const Color.fromARGB(255, 223, 223, 223),
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4),
                                            ),
                                            ),                        
                                          
                                            padding: const EdgeInsets.all(10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  
                                                  const Text("Fecha",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold)),
                                                  Container(
                                                  padding: const EdgeInsets.all(20),
                                                  //Dia mes y año como chils
                                                  child: Text(torneo.fecha_max_juego.day.toString()+"/"+torneo.fecha_max_juego.month.toString()+"/"+torneo.fecha_max_juego.year.toString())
                                                  )
                                                ]
                                              ),
                                              Column(
                                                children: [
                                                  
                                                  const Text("Jugadores",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold)),
                                                  Container(
                                                  padding: const EdgeInsets.all(20),
                                                  child: Text(torneo.jugadores.toString())
                                                  )
                                                ]
                                              )                                              
                                            ],)
                                        ),
                                      ],
                                    )
                                    ))
                        )),

                  //Text(torneo.toString())
                ],
              );

              return c;
            } else {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
            }
          }
          //return const CircularProgressIndicator();
          return const Text("");
        });
  }

  @override
  Widget build(BuildContext context) {
    actualizarTorneos();
    //getTorneos();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Torneos"),
        ),
      ),

      body: RefreshIndicator(
        onRefresh: () async{
          actualizarTorneos();

          setState(() {
          });
        },
        child: ListView(
          children: [
            SingleChildScrollView(
        child: getTorneos()
          )]))
    );
  }
}
