import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Puntuacion {
  int id;
  int usuario_id;
  int puntuacion;
  DateTime fecha;

  Puntuacion({
    required this.id,
    required this.usuario_id,
    required this.puntuacion,
    required this.fecha,
  });

  @override
  String toString() {
    return "id: $id, usuario_id: $usuario_id, puntuacion: $puntuacion, fecha: $fecha";
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'usuario_id': usuario_id,
        'puntuacion': puntuacion,
        'fecha': fecha,
      };

  Puntuacion.fromJson(Map<String, dynamic> json):
        id = json['id'],
        usuario_id = json['usuario_id'],
        puntuacion = json['puntuacion'],
        fecha = DateTime.parse(json['fecha']);
}

class PuntuacionInd {
  List<Puntuacion> puntuaciones= [];
  static const String _baseAddress = 'clados.ugr.es';
  static const String _applicationName = 'DS1_7/api/v1/';

  @override
  String toString() {
    String res = "";
    for (Puntuacion puntuacion in puntuaciones) {
      res += puntuacion.toString() + "\n";
    }

    return res;
  }

  Map<String, dynamic> toJson() =>{
    'puntuaciones': puntuaciones,
  };

  PuntuacionInd.fromJson(List<dynamic> json){
    //Inserta en la lista de puntuaciones los objetos Puntuacion que se encuentran en el json
    //for (var i = 0; i < json.length; i++) {
    //  puntuaciones.add(Puntuacion.fromJson(json[i]));
    //}

    puntuaciones = json.map((puntuacion) => Puntuacion.fromJson(puntuacion)).toList();    
  }

  //////////// get //////////////////
  static Future<PuntuacionInd> getPuntuaciones(int user) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/juega_individuals/$user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

  //throw Exception('Failed to get puntuaciones');
    if (response.statusCode == 200) {
      return PuntuacionInd.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get puntuaciones');
    }
  }

  ////////////// create ///////////////
static Future<PuntuacionInd> createPuntuacion(  int usuario_id, int puntuacion ) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/juega_individuals'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "usuario_id": usuario_id.toString(),
        "puntuacion": puntuacion.toString(),
        "fecha": DateTime.now().toString()
      }),
    );
    if (response.statusCode == 201) {
      return PuntuacionInd.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create project');
    }

  }

}
