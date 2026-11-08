import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductoCard extends StatelessWidget {
   
const ProductoCard({
  super.key,
  required this.producto,
  });
  
  final Producto producto;

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;

    return  Card(
      elevation: 3,

      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: FadeInImage(
                fit: BoxFit.contain,
                placeholder: AssetImage('assets/img/logo.png'),
                image: NetworkImage(producto.imagen),
                imageErrorBuilder: (_, _, _) =>
                    Image.asset('assets/img/logo.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  producto.titulo,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                // "??" muestra un texto alterno si la marca es null
                Text(
                  producto.marca ?? 'Sin marca',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      // toStringAsFixed(2): siempre 2 decimales -> $999.00
                      '\$${producto.precio.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: colores.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.amber),
                        Text(producto.rating.toStringAsFixed(1),
                            style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
