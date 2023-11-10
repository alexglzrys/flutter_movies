import 'package:flutter/material.dart';
import 'package:app_peliculas/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      // Generar mapa con rutas de la aplicaciòn
      routes: {
        // _ es una convención en Flutter para indicar que el parámetro que recibe la función no se va a utilizar dentro del bloque de código
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailsScreen()
      },
    );
  }
}
