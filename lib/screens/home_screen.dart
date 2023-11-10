import 'package:app_peliculas/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        children: [
          CardSwiper()

          // TODO: Listado horizontal de películas
        ],
      ),
    );
  }
}
