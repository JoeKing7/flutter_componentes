import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _valorCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SafeArea(
          child: Text('Slider'))
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.orangeAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0, 
      onChanged: ( _valorCheck ) ? null : ( value ){
        setState(() {
          _valorSlider = value;
        });
      },
    );
  }


  Widget _crearCheckBox() {
    // return Checkbox(
    //   value: _valorCheck, 
    //   onChanged: ( value ) {
    //     setState(() {
    //       _valorCheck = value!;
    //     });
    //   }
    // );

    return CheckboxListTile(
      title: const Text('Bloquear slider'),
      value: _valorCheck, 
      onChanged: ( value ) {
        setState(() {
          _valorCheck = value!;
        });
      }
    );
  }


  Widget _crearSwitch() {
    return SwitchListTile(
      title: const Text('Bloquear slider'),
      value: _valorCheck, 
      onChanged: ( value ) {
        setState(() {
          _valorCheck = value;
        });
      }
    );
  }
  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://res.cloudinary.com/dfcwaujo8/image/upload/v1640876310/iuqacwesmux2fmk5zhis.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

}