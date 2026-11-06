// Capa de SERVICIOS: única parte de conexión con la API.
// obtiene lista objetos con petición GET.
// API: DummyJSON (https://dummyjson.com) — pública y sin token.

import 'dart:convert';

import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:http/http.dart' as http;


class ProductosService {
  // URL base de la API
  static const String _baseUrl = 'https://dummyjson.com/products/category';

  //Categorias computadoras
  static const List<String> categorias = [
    'laptops', 'tablets', 'mobile-accessories',
  ];

  Future<List<Producto>> _obtenerPorCategoria(String categoria) async {
    //Dirección completa que espera el paquete http.
    final url = Uri.parse('$_baseUrl/$categoria');

    //http.get hace la petición GET.
    final respuesta = await http .get(url).timeout(const Duration(seconds: 10));

    if (respuesta.statusCode != 200) {
      throw Exception('Error HTTP ${respuesta.statusCode} en "$categoria"');
    }

    // DummyJSON responde: { "products": [ {...}, {...} ], "total": n, ... }
    final Map<String, dynamic> data = jsonDecode(respuesta.body);
    final List<dynamic> lista = data['products'];

    return lista.map((item) => Producto.fromJson(item)).toList();

  }

    // Método público que usa el provider: trae todas las categorías.
  Future<List<Producto>> obtenerProductos() async {
    // Future.wait lanza las 3 peticiones al mismo tiempo Si alguna falla, lanza la excepción.
    final resultados = await Future.wait(
      categorias.map((c) => _obtenerPorCategoria(c)),
    );

    // expand muestra en una sola lista:  [[laptops], [tablets], [accesorios]] -> [todos los productos]
    return resultados.expand((lista) => lista).toList();
  }
}