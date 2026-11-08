import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:actividad_integradora_1/services/product_service.dart';
import 'package:flutter/foundation.dart';

class ProductosProvider extends ChangeNotifier { 

  final ProductosService _service = ProductosService();

  // Estados
  List<Producto> _productos = [];
  bool _cargando = false;
  String? _error;
  String? _categoriaSeleccionada;
  
  String? _message;

  List<Producto> get productos => _productos;
  bool get cargando => _cargando;
  String? get error => _error;
  String? get categoriaSeleccionada => _categoriaSeleccionada;

  String? get message => _message;

  List<String> get categorias => ProductosService.categorias;

  // Carrusel del Home
  List<Producto> get destacados {
    final copia = [..._productos];
    copia.sort((a, b) => b.rating.compareTo(a.rating));
    return copia.take(5).toList();
  }

  // productos del Catálogo 
  List<Producto> get productosFiltrados {
    if (_categoriaSeleccionada == null) return _productos;
    return _productos
        .where((p) => p.categoria == _categoriaSeleccionada)
        .toList();
  }

  ProductosProvider() {
    cargarProductos();
  }

  //filtro del Catálogo.
  void seleccionarCategoria(String? categoria) {
    _categoriaSeleccionada = categoria;
    notifyListeners(); 
  }

  //recorre los tres estados.
  Future<void> cargarProductos() async {
    // 1) Estado CARGANDO
    _message = 'Estado CARGANDO';
    debugPrint(_message);
    _cargando = true;
    _error = null;
    notifyListeners(); 

    try {
      // 2) Estado ÉXITO
      _message = 'Estado EXITO';
      debugPrint(_message);
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
