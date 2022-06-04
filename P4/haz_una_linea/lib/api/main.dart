// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'torneo.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  Future<Torneo>? _futureTorneo;
  final TextEditingController _teamController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  bool _idEntered = false;
  bool _teamEntered = false;
  bool _nameEntered = false;
  late int _menuItem;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'API client',
        theme: ThemeData(primarySwatch: Colors.green),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Networking Example - API Rails'),
            ),
            body: Center(
                child: Column(children: <Widget>[
              Row(children: [
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: TextField(
                            textAlign: TextAlign.center,
                            controller: _idController,
                            decoration: const InputDecoration(
                                labelText: 'ID',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.teal))),
                            onSubmitted: (val) {
                              setState(() {
                                if ((int.tryParse(val) ?? -1 ) > 0) _idEntered = true;
                              });
                            }))),
                Expanded(
                    child: PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    if (_idEntered)
                      const PopupMenuItem(
                        value: 1,
                        child: Text("GET"),
                      ),
                   /* if (_idEntered)
                      const PopupMenuItem(
                        value: 2,
                        child: Text("DELETE"),
                      ),
                    if (_idEntered && (_nameEntered || _teamEntered))
                      const PopupMenuItem(
                        value: 3,
                        child: Text("UPDATE"),
                      ),
                    if (_nameEntered && _teamEntered)
                      const PopupMenuItem(
                        value: 4,
                        child: Text("CREATE"),
                      ),*/
                  ],
                  initialValue: 1,
                  onSelected: (value) {
                    setState(() {

                        // find.text('project team').focused=false;
                      _menuItem=value;
                      switch (value) {
                        case 1:
                          _futureTorneo =
                              Torneo.getTorneo(_idController.text);
                          break;
                        /*case 2:
                          //_futureTorneo =
                            //  TorneodeleteProject(_idController.text);
                          break;*/
                       /* case 3:
                          _futureTorneo = Torneo.updateProject(
                              name: _nameController.text,
                              team: _teamController.text,
                              id: _idController.text);
                          break;
                        /*  */
                        case 4:

                          _futureTorneo = Torneo.createProject(
                              name: _nameController.text,
                              team: _teamController.text);
                          setState(() {

                            _idController.text = "";
                          }
                          );
bre;
*/                          
                      }
                      //;
                    });
                  },
                  icon: const Icon(Icons.list),
                ))
              ]),
              Row(children: [
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: TextField(
                            textAlign: TextAlign.center,
                            controller: _nameController,
                            decoration: const InputDecoration(
                                labelText: 'project name',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.teal))),
                            onSubmitted: (val)  {
                              setState(() {
                                if (_nameController.text != '') {
                                  _nameEntered = true;
                                }
                              });
                            }))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: TextField(
                            textAlign: TextAlign.center,
                            controller: _teamController,
                            decoration: const InputDecoration(
                                labelText: 'project team',
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.teal))),
                            onSubmitted: (val) {
                              setState(() {
                                if (_teamController.text != '') {
                                  _teamEntered = true;
                                }
                              });
                            }))),
              ]),
              if (_idEntered)

                  FutureBuilder<Torneo>(
                      future: _futureTorneo,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.done)
                          if (snapshot.hasData) {
                            if (_menuItem == 4) {
                              _idController.text = snapshot.data!.id.toString();
                            }
                            return Text(snapshot.data.toString());
                          }
                          else {
                            if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                          }
                        return const CircularProgressIndicator();
                      })

              else
                const Text("")
            ]))));
  }
}
