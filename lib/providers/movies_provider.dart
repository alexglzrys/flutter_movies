import 'package:flutter/material.dart';

// Clase que maneja parte del estado global de la aplicación (películas)

// Para que esta clase pueda ser utilizada por el paquete Provider, es necesario que extienda de ChangeNotifier para notificar de posibles cambios a los oyentes que consuman dicho estado
class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('MoviesProvider incializado');
    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() {
    print('getOnDisplayMovies');
  }
}
