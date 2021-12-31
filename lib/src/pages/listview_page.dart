import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  _ListaPageState createState() => _ListaPageState();
  
  List<int> _listaNumeros = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _crearLista(),
    );
  }

  Widget _crearLista() {
    return ListView.builder(
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index) {
        final image = _listaNumeros[index];
        return FadeInImage(
          placeholder: AssetImage('assets/images/icons8-dot-bricks.gif'), 
          image: NetworkImage('https://picsum.photos/500/300/?image=$image')
        );
      } //encargado de renderizar los elementos que estan contenidos
    );
  }
}