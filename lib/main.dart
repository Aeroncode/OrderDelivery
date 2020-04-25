import 'package:flutter/material.dart';

import 'helper.dart';
import 'widget/splashScreen.dart';
import 'widget/home.dart';
import 'widget/localisation.dart';
import 'widget/summary.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: primaryColor,
      primaryTextTheme: TextTheme(
        title: TextStyle( color: primaryColor )
      )
    ),
    //home: SplashScreen(),
    initialRoute: '/',
    routes: <String, WidgetBuilder> {
      '/': (BuildContext context) => SplashScreen(), // l'entrée de l'application
      '/home': (_) => Home(),
      '/localisation': (_) => Localisation(),
      '/summary': (_) => Summary(),
    }
  ));
}