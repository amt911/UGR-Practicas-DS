import 'dart:convert';

import 'package:http/http.dart' as http;

class Torneo {
  int id;
  String nombre, descripcion;
  DateTime fecha_max_juego;
  bool esBomba;
  int piezasPuestas;
  double multiplier;
  double probabilidad;
  int jugadores;

  static const String _baseAddress = 'clados.ugr.es';

  static const String _applicationName = 'DS1_7/api/v1/';

  //{"id":1,"nombre":"hazlo","fecha_max_juego":"2022-06-23","es_bomba":true,"multiplier":1,"piezas_puestas":12,"descripcion":"asdasdasdasd","created_at":"2022-06-05T18:02:42.688Z","updated_at":"2022-06-05T18:02:42.688Z"}
  Torneo(
      {required this.id,
      required this.nombre,
      required this.fecha_max_juego,
      required this.esBomba,
      required this.multiplier,
      required this.piezasPuestas,
      required this.descripcion,
      required this.probabilidad,
      required this.jugadores});

  @override
  String toString() {
    return "id: $id, nombre: '$nombre', fecha_max_juego: $fecha_max_juego, esBomba: $esBomba, multiplier: $multiplier, piezasPuestas: $piezasPuestas, descripcion: '$descripcion' probabilidad: $probabilidad, jugadores: $jugadores";
    //return "as";
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nombre': nombre,
        'fecha_max_juego': fecha_max_juego,
        'es_bomba': (esBomba)?1:0,
        'multiplier': multiplier,
        'piezas_puestas': piezasPuestas,
        'descripcion': descripcion,
        'probabilidad': probabilidad,
        'jugadores': jugadores,
      };

  Torneo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nombre = json['nombre'],
        fecha_max_juego = DateTime.tryParse(json['fecha_max_juego'])!,
        esBomba = (json['es_bomba']==1 || json['es_bomba']==true)?true:false,
        multiplier = json['multiplier'],
        piezasPuestas = json['piezas_puestas'],
        descripcion = json['descripcion'],
        probabilidad = json['probabilidad'],
        jugadores = (json['jugadores']==null)?0:json['jugadores'];

  //////////// get //////////////////
  static Future<Torneo> getTorneo(int id) async {
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
}
