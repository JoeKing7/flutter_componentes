import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    rootBundle.loadString('data/menu_opts.json').then((data) {
      Map dataMap = json.decode(data);
      opciones = dataMap['rutas'];
    });

    return opciones;
  }
}

final menuProvider = _MenuProvider();
