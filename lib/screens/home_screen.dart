import 'package:app_peliculas/providers/movies_provider.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener la instancia de MoviesProvider que se encuentra dentro del arbol de widgets
    // Esta instancia se genera cuando se invoca a ChangeNotifierProvider dentro del listado de providers
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Películas en Cines',
        ),
        elevation: 0,
        centerTitle: true,
        // Sección para declarar widgets en el área del AppBar que generalmente detonarán alguna acción al ser presionados
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Carrusel
            CardSwiper(movies: moviesProvider.onDisplayMovies),
            // Listado horizontal de películas
            const MovieSlider()
          ],
        ),
      ),
    );
  }
}
