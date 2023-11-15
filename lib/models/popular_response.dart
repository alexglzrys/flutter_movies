import 'dart:convert';
import 'package:app_peliculas/models/models.dart';

// https://app.quicktype.io/

// Los modelos prácticamente definen el esquema de como se encuentra constituida la información de una cierta entidad de nuestra aplicación.
// Para este caso el listado de peliculas populares

class PopularResponse {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  // Mapear respuesta JSON a una instancia de PopularResponse
  factory PopularResponse.fromRawJson(String str) =>
      PopularResponse.fromJson(json.decode(str));

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      PopularResponse(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
