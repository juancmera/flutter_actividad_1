import 'package:actividad_integradora_1/rutes/app_routes.dart';
import 'package:actividad_integradora_1/theme/tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: techStoreTheme(),
      //home: FormScreen (),

      //Rutas
      initialRoute: AppRoutes.inicio,
      routes: AppRoutes.rutas,


    );
  }
}