import 'package:app_peliculas/widgets/casting_card.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Reemplazar posteriormente por una instancia de Movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-info';

    return Scaffold(
        // CustomScrollView permite crear efectos de desplazamiento personalizados utilizando "slivers".
        body: CustomScrollView(
      slivers: [
        const _CustomAppBar(),
        // Dado que CustomScrollView solo recibe hijos de tipo "sliver" que reaccionan a efectos de desplazamiento. SliverChildListDelegate permite pasar una lista de widgets clásicas
        SliverList(
            delegate: SliverChildListDelegate([
          const _PosterAndTitle(),
          const SizedBox(height: 20),
          const _Overview(),
          const _Overview(),
          const _Overview(),
          const CastingCard()
        ]))
      ],
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
          padding: const EdgeInsets.only(bottom: 12),
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
          // Ambas imágenes tendran el mismo alto, evitando desbordamientos por tamaños diferentes
          height: 300,
        ),
      ),
    );
  }
}

// Widget que representa el poster y titulo de la película
class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    // Recuperar información del tema principal de la aplicación referente a los textos
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/images/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              // Evitar que existan desbordamientos a consecuencia de tamaños diferentes tanto en la imagen final como en la temporal
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Titulo
            Text(
              'movie.title',
              style: textTheme.headlineSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            // Titulo original de la película
            Text(
              'movie.subtitle',
              style: textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            // Promedio de votos
            Row(
              children: [
                const Icon(
                  Icons.star_outlined,
                  size: 15,
                  color: Colors.grey,
                ),
                const SizedBox(width: 5),
                Text(
                  'movie.votes',
                  style: textTheme.bodySmall,
                )
              ],
            )
          ])
        ],
      ),
    );
  }
}

// Widget que representa la descripción completa de la película
class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Text(
        'Anim aliqua pariatur non aute commodo. Aute amet reprehenderit consectetur quis id laboris eu consectetur est incididunt ut proident. Nulla fugiat magna quis tempor. Cupidatat pariatur eu esse aliquip. Dolor ex laborum aute aute consectetur fugiat nisi excepteur esse veniam pariatur cillum.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
