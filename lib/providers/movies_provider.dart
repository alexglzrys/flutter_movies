import 'dart:convert';

import 'package:app_peliculas/models/now_playing_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Clase que maneja parte del estado global de la aplicación (películas)

// Para que esta clase pueda ser utilizada por el paquete Provider, es necesario que extienda de ChangeNotifier para notificar de posibles cambios a los oyentes que consuman dicho estado
class MoviesProvider extends ChangeNotifier {
  // Propiedades finales que hacen referencia al servicio o API que consume la aplicación
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '8ecc5be4b5b0099bbeaab602ec74b3b5';
  final String _language = 'es-ES';

  MoviesProvider() {
    print('MoviesProvider incializado');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    print('getOnDisplayMovies');
    // Preparar el esquema de la cadena URL que apunta al servicio de peliculas en cartelera
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'language': _language, 'page': '1', 'api_key': _apiKey});
    // Enviar la petición Http
    var response = await http.get(url);
    // Decodificar la respuesta entregada por el servidor en un mapa
    // final Map<String, dynamic> decodeData = json.decode(response.body);

    // Generar una instancia de NowPlayingResponse a partir de la respuesta entregada por el servidor referente al listado de películas en cartelera
    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
    print(nowPlayingResponse.results[0].title);
  }
}
