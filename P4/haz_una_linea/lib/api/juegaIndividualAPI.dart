/*
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Usuario {
  int id;
  String nombre;
  String contrasena;
  bool admin;

  static const String _baseAddress = 'clados.ugr.es';
  static const String _applicationName = 'DS1_7/api/v1/';

  Usuario({
    required this.id,
    required this.nombre,
    required this.contrasena,
    required this.admin,
  });

  @override
  String toString() {
    return "id: $id, nombre: '$nombre', contrasena: '$contrasena', admin: $admin";
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'contrasena': contrasena,
        'admin': admin,
      };

  Usuario.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nombre = json['nombre'],
        contrasena = json['contrasena'],
        admin = json['admin'];

  //////////// get //////////////////
  static Future<Usuario> getUsuario(String user) async {
    final response = await http.get(
        Uri.https(_baseAddress, '$_applicationName/usuarios/$user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      return Usuario.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get usuario');
    }
  }
}
*/