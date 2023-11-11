import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context) devuelve una instancia de MediaQueryData que contiene información sobre las dimensiones y propiedades de la pantalla actual (dispositivo)
    // Prácticamente se obtiene el tamaño de la pantalla del dispositivo
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      // El alto del widget será el 50% del alto de la pantalla del dispositivo
      height: size.height * 0.5,
      // Flutter cuenta con miles de paquetes de terceros que pueden ser implementados en nuestros proyectos
      // CardSwiper es un paquete que ofrece diferentes tipos de carruseles para Flutter
      // https://pub.dev/packages/card_swiper
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.6,
        itemBuilder: (_, index) {
          // GestureDetector se utiliza para reconocer y responder a diversos gestos táctiles del usuario (toques, deslizamientos, doble toques, arrastres, entre otros.) sobre el elemento que envuelve dicho widget (hijo).
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-details'),
            // ClipRRect recorta las esquinas de su hijo en forma redondeada (bordes redondeados)
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              // FadeInImage se usa para mostrar imagenes que pueden demorar en cargarse, mientras la imagen de destino se carga, se muestra imagen de marcador de posición en su lugar. Cuando la imagen de destino esta lista, se desvanece suavemente la imagen de marcador para dar lugar a la nueva imagen
              child: const FadeInImage(
                placeholder: AssetImage('assets/images/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                fit: BoxFit.cover,
                // Ambas imágenes tendran el mismo alto, evitando desbordamientos por tamaños diferentes
                height: 400,
              ),
            ),
          );
        },
      ),
    );
  }
}
