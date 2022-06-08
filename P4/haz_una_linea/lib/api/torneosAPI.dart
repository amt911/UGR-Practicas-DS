import 'dart:convert';

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

    //throw Exception('xdd:${TorneosAPI.fromJson(jsonDecode(response.body)).torneos[0].id}');
    if (response.statusCode == 200) {
      return TorneosAPI.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get torneo');
    }
  }
}
