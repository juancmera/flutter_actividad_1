class Componentes {
  final String codigo;
  final String nombre;
  final String cantidad;
  final String precio;
  final String descripcion;

  Componentes({
    required this.codigo,
    required this.nombre,
    required this.cantidad,
    required this.precio,
    required this.descripcion,
  });
}

// Modelo de datos: producto recibido de API.
// Convierte JSON -> objeto Dart (fromJson) y objeto -> JSON (toJson).
class Producto {
  final int id;
  final String titulo;
  final String descripcion;
  final String categoria;
  final double precio;
  final double rating;
  final String? marca; // algunos productos de la API no traen marca
  final int stock;
  final String imagen;

  Producto({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.categoria,
    required this.precio,
    required this.rating,
    required this.stock,
    required this.imagen,
    this.marca,
  });

  // factory constructor: recibe el Map que viene del JSON y lo transforma en un Producto.
  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json['id'],
        titulo: json['title'],
        descripcion: json['description'],
        categoria: json['category'],
        // as num: acepta int o double y toDouble() los unifica para que no falle.
        precio: (json['price'] as num).toDouble(),
        rating: (json['rating'] as num).toDouble(),
        marca: json['brand'],
        stock: json['stock'],
        imagen: json['thumbnail'],
      );

  // toJson: proceso inverso. Devuelve el objeto como Map con las mismas claves de la API
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': titulo,
        'description': descripcion,
        'category': categoria,
        'price': precio,
        'rating': rating,
        'brand': marca,
        'stock': stock,
        'thumbnail': imagen,
      };
}
