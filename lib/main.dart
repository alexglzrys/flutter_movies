import 'package:app_peliculas/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_peliculas/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

// Widget que define el listado de proveedores de estado global que usará la aplicación
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiProvider() acepta una lista de proveedores de estado a los que pueden acceder los widgets descendientes. En este caso de MyApp
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider() crea una instancia singletón del proveedor especificado, escucha los cambios y notifica a sus oyentes de posibles cambios
        // Por defecto solo se crea una sola instancia de forma perezosa, es decir, se crea cuando algún widget debajo del árbol solicita consumir o modificar información. Con lazy = false, indicamos que esa instancia se genere al momento de lanzar la aplicación
        ChangeNotifierProvider(
            create: (context) => MoviesProvider(), lazy: false)
      ],
      child: const MyApp(),
    );
  }
}

// Widget que representa la aplicación principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      // Existen 2 temas predeterminados en Dart: light y dark
      // Crea una copia del tema light, y solo personaliza el tema (color) de la barra de aplicaciones
      theme: ThemeData.light()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.teal[600])),
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
