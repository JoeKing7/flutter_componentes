import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  _ListaPageState createState() => _ListaPageState();
  
  final ScrollController _scrollController = ScrollController();
  final List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;


  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        //quiere decir que estamos en el final de la page
        // _agregar10();
        _fetchData();
      }
    });
  }

@override
  void dispose() { //se dispara cuando la page deja de existir
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading()
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPage1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listaNumeros[index];
          return FadeInImage(
            placeholder: const AssetImage('assets/images/icons8-dot-bricks.gif'), 
            image: NetworkImage('https://picsum.photos/500/300/?image=$image')
          );
        } //encargado de renderizar los elementos que estan contenidos
      ),
    );
  }

 Future<void> obtenerPage1() async {
   const duration = Duration(seconds: 2);
   Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
  });
  return Future.delayed(duration);
 }
  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {
      
    });
  }

  Future<void> _fetchData() async {
    _isLoading = true;
    setState(() {});
    const duration = Duration(seconds: 2);
    Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 250)
    );
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0
          )
        ],
      ); 
      
    } else {
      return Container();
    }
  }
}