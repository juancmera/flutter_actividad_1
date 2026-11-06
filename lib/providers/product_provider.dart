// Provider: administra el ESTADO de los productos de la API:
// - Loading  -> _cargando = true
// - Success  -> _productos tiene datos
// - Error    -> _error tiene un mensaje

import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:actividad_integradora_1/services/product_service.dart';
import 'package:flutter/foundation.dart';

// extends ChangeNotifier: método que redibuja a todos los widgets que escuchan este provider.
class ProductosProvider extends ChangeNotifier { 

  final ProductosService _service = ProductosService();

  // Estados
  List<Producto> _productos = [];
  bool _cargando = false;
  String? _error;

  String? _categoriaSeleccionada;

  // get solo lectura
  List<Producto> get productos => _productos;
  bool get cargando => _cargando;
  String? get error => _error;
  String? get categoriaSeleccionada => _categoriaSeleccionada;

  // Lista de categorías disponible 
  List<String> get categorias => ProductosService.categorias;

  // Carrusel del Home: los 5 mejor valorados.
  List<Producto> get destacados {
    final copia = [..._productos]; // copia para no alterar el catálogo
    copia.sort((a, b) => b.rating.compareTo(a.rating)); // mayor a menor
    return copia.take(5).toList();
  }

  // productos que se muestran en el Catálogo 
  List<Producto> get productosFiltrados {
    if (_categoriaSeleccionada == null) return _productos;
    return _productos
        .where((p) => p.categoria == _categoriaSeleccionada)
        .toList();
  }

  // Constructor: se ejecuta al crear el provider en main.dart y carga los datos al iniciar la app.
  ProductosProvider() {
    cargarProductos();
  }

  // cambia el filtro del Catálogo.
  void seleccionarCategoria(String? categoria) {
    _categoriaSeleccionada = categoria;
    notifyListeners(); // la grilla se redibuja con el nuevo filtro
  }

  // carga productos a la API y recorre los tres estados.
  Future<void> cargarProductos() async {
    // 1) Estado CARGANDO
    _cargando = true;
    _error = null; // limpia un error anterior (reintento)
    notifyListeners(); 

    try {
      // 2) Estado ÉXITO
      _productos = await _service.obtenerProductos();
    } catch (e) {
      // 3) Estado ERROR
      _error = 'No se pudo conectar con el servidor. Revisa tu conexión a internet.';
      debugPrint('Error al cargar productos: $e'); 
    } finally {

      // muestre los datos (Success) o el error (Error).
      _cargando = false;
      notifyListeners();
    }
  }
}
