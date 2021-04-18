import 'package:bar_social_app/screens/game_screen.dart';
import 'package:bar_social_app/screens/home_screen.dart';
import 'package:bar_social_app/screens/login_register_screen.dart';
import 'package:bar_social_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BarSocialApp());
}

// cuando entro en la app tengo que verificar si el token que esta guardado en localstorage
// es valido con el que esta guardado en el backend
// si no lo es, entonces lo envio

class BarSocialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: '/',
      debugShowCheckedModeBanner: false,
      //routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      //  '/': (context) => HomeScreen(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      //  '/login_register': (context) => LoginRegisterScreen(),
      //  '/game_screen': (context) => GameScreen(),
      //},
      home: WelcomeScreen(),
    );
  }
}

// 1 - login, mando datos y me devuelve token
// 2 - guardo el token recibido en el localStorage
// 3 - una vez cerrada la app debo verificar si existe token en localstorage y si no lo hay, lo envío al login
// 
//  
// 
// 
