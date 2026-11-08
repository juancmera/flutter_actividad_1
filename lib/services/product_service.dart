import 'dart:convert';

import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:http/http.dart' as http;


class ProductosService {
  // URL base de la API
  static const String _baseUrl = 'https://dummyjson.com/products/category';

  static const List<String> categorias = [
    'laptops', 'tablets', 'mobile-accessories',
  ];

  Future<List<Producto>> _obtenerPorCategoria(String categoria) async {
    final url = Uri.parse('$_baseUrl/$categoria');
    final respuesta = await http .get(url).timeout(const Duration(seconds: 10));

    if (respuesta.statusCode != 200) {
      throw Exception('Error HTTP ${respuesta.statusCode} en "$categoria"');
    }

    // DummyJSON responde: { "products": [ {...}, {...} ], "total": n, ... }
    final Map<String, dynamic> data = jsonDecode(respuesta.body);
    final List<dynamic> lista = data['products'];

    return lista.map((item) => Producto.fromJson(item)).toList();

  }

  Future<List<Producto>> obtenerProductos() async {

    final resultados = await Future.wait(
      categorias.map((c) => _obtenerPorCategoria(c)),
    );

    return resultados.expand((lista) => lista).toList();
  }
}