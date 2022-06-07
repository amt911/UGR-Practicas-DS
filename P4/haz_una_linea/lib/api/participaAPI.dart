import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PuntuacionTorneo {
  int torneo_id;
  int usuario_id;
  int puntuacion;
  String nombre;
  //DateTime fecha;

  PuntuacionTorneo({
    required this.torneo_id,
    required this.usuario_id,
    required this.puntuacion,
    required this.nombre,
  });

  @override
  String toString() {
    //return "torneo_id: $torneo_id, usuario_id: $usuario_id, puntuacion: $puntuacion, fecha: $fecha";
    return "torneo_id: $torneo_id, usuario_id: $usuario_id, puntuacion: $puntuacion, nombre: $nombre";
  }

  Map<String, dynamic> toJson() => {
        'torneo_id': torneo_id,
        'usuario_id': usuario_id,
        'puntuacion': puntuacion,
        'nombre': nombre
      };

  PuntuacionTorneo.fromJson(Map<String, dynamic> json):
        torneo_id = json['torneo_id'],
        usuario_id = json['usuario_id'],
        puntuacion = json['puntuacion'],
        nombre = json['nombre'];
}

class PuntuacionTorneosAPI {
  List<PuntuacionTorneo> puntuaciones= [];
  static const String _baseAddress = 'clados.ugr.es';
  static const String _applicationName = 'DS1_7/api/v1/';

  @override
  String toString() {
    String res = "";
    for (PuntuacionTorneo puntuacion in puntuaciones) {
      res += puntuacion.toString() + "\n";
    }

    return res;
  }

  Map<String, dynamic> toJson() =>{
    'puntuaciones': puntuaciones,
  };

  PuntuacionTorneosAPI.fromJson(List<dynamic> json){
    puntuaciones = json.map((puntuacion) => PuntuacionTorneo.fromJson(puntuacion)).toList();
    //json.map((puntuacion) => PuntuacionTorneosAPI.fromJson(puntuacion)).toList();    
  }

  //////////// get //////////////////
  static Future<PuntuacionTorneosAPI> getPuntuaciones(int torneo_id) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/participas/$torneo_id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

  //throw Exception('Failed to get puntuaciones');
    if (response.statusCode == 200) {
      return PuntuacionTorneosAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get puntuaciones');
    }
  }

  ////////////// create ///////////////
static Future<PuntuacionTorneosAPI> createPuntuacion(  int usuario_id, int puntuacion, int torneo_id ) async {
    final response = await http.post(
      Uri.https(_baseAddress, '$_applicationName/participas'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "torneo_id": torneo_id.toString(),
        "usuario_id": usuario_id.toString(),
        "puntuacion": puntuacion.toString(),
        //"fecha": DateTime.now().toString()
      }),
    );
    
    if (response.statusCode == 201) {
      return PuntuacionTorneosAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create project');
    }
  }
}
