import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:actividad_integradora_1/theme/tema.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';


class CardSwiper extends StatelessWidget {
   
const CardSwiper({
  super.key,
  required this.size,
  required this.productos,
  });

  final Size size;
  final List<Producto> productos;
  
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: TechStoreColors.amberBg,
      width: double.infinity,
      height: size.height * .5,

      child: Swiper(
        itemCount: productos.length, // antes: 10 fijo
        itemHeight: size.height * 0.42, // menor que el alto del Container
        itemWidth: size.width * 0.6,
        layout: SwiperLayout.STACK,

        //Crea n items, iteración por cada item
        itemBuilder: (_, index) {
          final producto = productos[index];

          return GestureDetector(
            onTap: () {
              // Aquí se podría navegar a un detalle del producto
            },

            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // Expanded: la imagen ocupa todo el espacio libre
                    Expanded(
                      child: FadeInImage(
                        width: double.infinity,
                        fit: BoxFit.contain, // no recorta el producto
                        placeholder: AssetImage('assets/img/logo.png'),
                        image: NetworkImage(producto.imagen),
                        // NUEVO — si la imagen falla, muestra el logo
                        // en lugar de romper el carrusel.
                        imageErrorBuilder: (_, _, _) =>
                            Image.asset('assets/img/logo.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        producto.titulo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis, // "..." si es largo
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
