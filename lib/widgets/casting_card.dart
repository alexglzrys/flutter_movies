import 'package:flutter/material.dart';

// Widget que representa la lista horizontal de los actores que participar en la película
class CastingCard extends StatelessWidget {
  const CastingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20, top: 20),
      height: 160,
      child: ListView.separated(
        itemBuilder: (_, index) => const _CastCard(),
        separatorBuilder: (_, index) => const SizedBox(
          width: 10,
        ),
        itemCount: 30,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

// Widget que representa la portada y nombre del actor
class _CastCard extends StatelessWidget {
  const _CastCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 160,
      child: Column(
        children: [
          // Imagen con bordes redondeados del actor
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const FadeInImage(
              placeholder: AssetImage('assets/images/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          // Nombre del actor
          const Text(
            'actor.name descripción resumida del actor',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
