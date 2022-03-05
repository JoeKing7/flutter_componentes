import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:componentes/src/pages/error_page.dart';

//reaundar en el video 34 sección 6/componentes
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
