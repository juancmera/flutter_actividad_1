
import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import '../screens/screens.dart';

class AppRoutes {
  // nombre rudas
  static const String inicio = '/';
  static const String registro = '/registro';
  static const String detalle = '/detalle';

  //mapa rutas
  static final Map<String, WidgetBuilder> rutas = {
    inicio: (context) => FormScreen (),
    registro: (context) => FormScreen(),

    //pasar el objeto utilizando componenteRecibido
    detalle: (context) {
      final componenteRecibido =
        ModalRoute.of(context)!.settings.arguments as Componentes;
      return DetailScreen(
        componenteRecibido: componenteRecibido,
      );
    },
  };


}