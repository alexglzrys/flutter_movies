import 'package:flutter/material.dart';
import '../models/models.dart';

class MovieSlider extends StatelessWidget {
  // Para que este widget funcione se requiere del listado de pelíoculas populares y un titulo opcional para dicha sección
  final List<Movie> movies;
  final String? title;
  const MovieSlider({super.key, required this.movies, this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Ocupa el 100% del ancho del dispositivo
      width: double.infinity,
      height: 250,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Verificar si se debe mostrar un titulo para la seccion
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            // Aunque el titulo es opcional, en este punto se sabe con certeza que si existe... !
            child: Text(
              title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),

        const SizedBox(
          height: 5,
        ),
        // Expanded: ocupará todo el resto del espacio disponible en el widget padre
        Expanded(
          // ListView necesita conocer explicitamente el tamaño de su contenedor padre para poder funcionar, en este caso la columna no tiene definido un tamaño. Para resolver este dilema se usa el widget Expanded
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (_, index) => _MoviePoster(movie: movies[index]),
            // Se usa como separador de elementos de la lista un SizeBox con ancho de 15 pixeles
            separatorBuilder: (_, index) => const SizedBox(
              width: 15,
            ),
          ),
        )
      ]),
    );
  }
}

// Widget privado que representa un poster de película en particular
// Para mejorar la lectura del código, es importante extraer los widgets complejos en clases separadas.
// Si el widget solo se usa en un solo lugar, lo mejor es declararlo en el mismo archivo como una clase privada. Si el widget se usa en varios lugares de la aplicaicón, lo conveniente es crear su propio archivo separado como clase pública
class _MoviePoster extends StatelessWidget {
  // Se requiere de una instancia de pelicula para que este widget funcione
  final Movie movie;
  const _MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 190,
      child: Column(
        children: [
          // Detectar y responder al gesto del tap sobre la imagen de portada de la película, y llevar al usuario a la pantalla de detalles
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-details'),
            // Aplicar bordes redondeados a la portada de la película
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              // Portada de la película
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImage),
                // Ambas imágenes tendran el mismo alto, evitando desbordamientos por tamaños diferentes
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          // Titulo de la película
          Text(
            movie.title,
            textAlign: TextAlign.center,
            // Número de renglónes y marcador de posición si la longitud del texto supera el espacio disponible
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
