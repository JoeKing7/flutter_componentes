import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  Color color = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
            child: Center(
                child: Text('Componentes', style: TextStyle(fontSize: 25.0)))
        ),
        backgroundColor: color,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData();
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data!, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    for (var opt in data) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.deepOrange),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);

          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);
        },
      );
      opciones..add(widgetTemp)..add(const Divider());
    }

    return opciones;
  }
}
