import 'dart:convert';

import 'package:http/http.dart' as http;

class Torneo {
  int id;
  String nombre;
  DateTime fecha_inscripcion;
  DateTime fecha_max_juego;

  static const String _baseAddress = 'clados.ugr.es';

  static const String _applicationName = 'DS1_7/api/v1/';

  Torneo(
      {required this.id,
      required this.nombre,
      required this.fecha_inscripcion,
      required this.fecha_max_juego});

  @override
  String toString() {
    return "id: $id, nombre: '$nombre', fecha_inscripcion: $fecha_inscripcion, fecha_max_juego: $fecha_max_juego";
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'fecha_inscripcion': fecha_inscripcion,
        'fecha_max_juego': fecha_max_juego
      };

  Torneo.fromJson(Map<String, dynamic> json):
        id = json['id'],
        nombre = json['nombre'],
        fecha_inscripcion = DateTime.tryParse(json['fecha_inscripcion'])!,
        fecha_max_juego = DateTime.tryParse(json['fecha_max_juego'])!;

  //////////// get //////////////////
  static Future<Torneo> getTorneo(String id) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/torneos/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return Torneo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get torneo');
    }
  }
/*
  ////////////// create ///////////////

  static Future<Torneo> createProject(
      {required String name, required String team}) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/projects/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'team': team, 'name': name}),
    );
    if (response.statusCode == 201) {
      return Torneo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create project');
    }
  }

//////////// delete //////////////////

  static Future<Torneo> deleteProject(String id) async {
    final http.Response response = await http.delete(
      Uri.https(_baseAddress, '$_applicationName/projects/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return Torneo(
          id: -1, nombre: "", fecha_inscripcion "Torneo with id ${id}was deleted", team: -1);
    } else {
      throw Exception('Failed to delete project.');
  }
*/
  /////////// update /////////
/*
  static Future<Torneo> updateProject(
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
      return Torneo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update project');
    }
  }
  */
}
