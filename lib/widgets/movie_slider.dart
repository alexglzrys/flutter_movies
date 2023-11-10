import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Ocupa el 100% del ancho del dispositivo
      width: double.infinity,
      height: 250,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Populares',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
            itemCount: 30,
            itemBuilder: (_, index) => const _MoviePoster(),
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
  const _MoviePoster({super.key});

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
              child: const FadeInImage(
                placeholder: AssetImage('assets/images/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Titulo de la película
          const Text(
            'El señor de los anillos y el regreso del maleficio de los 13 planetas',
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
