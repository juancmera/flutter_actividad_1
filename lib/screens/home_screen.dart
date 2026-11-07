
import 'package:actividad_integradora_1/widgets/appbar_widget.dart';
import 'package:actividad_integradora_1/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const BarraDefault(),
      drawer: const MenuLateral(),
      body: Center(
         child: Text('HomeScreen'),
      ),
    );
  }
}