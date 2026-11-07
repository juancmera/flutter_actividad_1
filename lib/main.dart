import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:actividad_integradora_1/providers/product_provider.dart';
import '../screens/screens.dart';
import 'package:actividad_integradora_1/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductosProvider(),
      child: const MyApp(),
    )
  
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechStore',
      debugShowCheckedModeBanner: false,
      theme: techStoreTheme(),
      //home: FormScreen (),

      //Rutas
      initialRoute: 'inicio',
      routes: {
        'inicio': (_) => HomeScreen(),
        'catalogo': (_) => const CatalogoScreen(),
        'registro': (_) => const FormScreen(),
        'detalle': (context) => DetailScreen(
          componenteRecibido:
              ModalRoute.of(context)!.settings.arguments as Componentes,
        ),
      },
    );
  }
}