import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';
  List<String> _poderes = ['Volar', 'Rayos x', 'Fuerza'];
  TextEditingController _inputFildDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SafeArea(
          child: Text('Inputs'),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPass(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            counter: Text('Letras ${_nombre.length}'),
            hintText: 'Nombre de la persona',
            labelText: 'Nombre',
            helperText: 'Solo el nombre',
            suffixIcon: Icon(Icons.accessibility),
            icon: Icon(Icons.account_circle)),
        onChanged: (valor) {
          setState(() {
            _nombre = valor;
          });
        });
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es $_nombre'),
      subtitle: Text('El email is $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Email',
            labelText: 'Email',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)),
        onChanged: (valor) {
          setState(() {
            _email = valor;
          });
        });
  }

  Widget _crearPass() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Password',
            labelText: 'Your pass',
            suffixIcon: Icon(Icons.password),
            icon: Icon(Icons.lock)),
        onChanged: (valor) {
          setState(() {
            _email = valor;
          });
        });
  }

  _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFildDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2999),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      _fecha = picked.toString();
      String onlyDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        _inputFildDateController.text = onlyDate;
      });
    }
  }


List<DropdownMenuItem<String>> getOpcionesDropdown() {
  List<DropdownMenuItem<String>> lista = [];
  _poderes.forEach( (poder) {
    lista.add(DropdownMenuItem(
      child: Text(poder),
      value: poder,
    ));
  });

  return lista;
}

Widget _crearDropDown() {
  return Row(children: <Widget>[
    const Icon(Icons.select_all),
    const SizedBox(width: 30.0),
    DropdownButton(
      value: _opcionSeleccionada,
      items: getOpcionesDropdown(),
      onChanged: (opt) {
        setState(() {
          _opcionSeleccionada = opt.toString();
        });
      },
    )
  ],);
  
}


}
