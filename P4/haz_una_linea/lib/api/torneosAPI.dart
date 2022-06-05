import 'dart:convert';
import 'dart:io';

import 'package:haz_una_linea/api/torneoAPI.dart';
import 'package:http/http.dart' as http;

class TorneosAPI {
  //Array con toda la informacion de abajo
  late List<Torneo> torneos = [];

  static const String _baseAddress = 'clados.ugr.es';
  static const String _applicationName = 'DS1_7/api/v1/';

  TorneosAPI({required this.torneos});

  @override
  String toString() {
    String res = "";
    for (Torneo torneo in torneos) {
      res += torneo.toString() + "\n";
    }

    return res;
  }

  Map<String, dynamic> toJson() => {
        'torneos': torneos,
      };

  TorneosAPI.fromJson(List<dynamic> json) {
    torneos = json.map((torneo) => Torneo.fromJson(torneo)).toList();
  }
  //////////// get //////////////////
  static Future<TorneosAPI> getTorneos() async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/torneos/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return TorneosAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get torneo');
    }
  }
/*
  ////////////// create ///////////////

  static Future<TorneosAPI> createProject(
      {required String name, required String team}) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/projects/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'team': team, 'name': name}),
    );
    if (response.statusCode == 201) {
      return TorneosAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create project');
    }
  }

//////////// delete //////////////////

  static Future<TorneosAPI> deleteProject(String id) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, '$_applicationName/projects/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return TorneosAPI(
          id: -1, nombre: "", fecha_inscripcion "TorneosAPI with id ${id}was deleted", team: -1);
    } else {
      throw Exception('Failed to delete project.');
  }
*/
  /////////// update /////////
/*
  static Future<TorneosAPI> updateProject(
      {String? nombre,
      DateTime? fecha_inscripcion,
      DateTime? fecha_max_juego,
      required Sfecha_max) async {
    final http.Response response = await http.put(
      Uri.https(_baseAddress, '$_applicationName/torneos/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nombre': nombre!,
        //'fecha_inscripcion': fecha_inscripcion!.toString(),
        //'fecha_max_juego': fecha_max_juego!.toString(),
      }),
ffecha_maxecha_inscfecha_max    );
    if (response.statusCode == 200) {
      return TorneosAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update project');
    }
  }
  */
}
