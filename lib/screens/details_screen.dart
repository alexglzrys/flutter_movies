import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Reemplazar posteriormente por una instancia de Movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-info';

    return const Scaffold(
        // CustomScrollView permite crear efectos de desplazamiento personalizados utilizando "slivers".
        body: CustomScrollView(
      slivers: [_CustomAppBar()],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Los slivers son porciones de la vista de desplazamiento que pueden cambiar su tamaño y posición basándose en el desplazamiento del usuario
    // SliverAppBar proporciona una AppBar que se expande y se contrae a medida que el usuario se desplaza.
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
