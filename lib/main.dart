import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/error_page.dart';

//reaundar en el video 31 sección 6/componentes
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      //home: HomePage()
      initialRoute: '/', //Establecemos la ruta inicial
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ErrorPage());
      },
    );
  }
}
