import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  final String etiqueta;
  final String textoAyuda;
  final TextEditingController controller;
  final IconData icono;
  final TextInputType tipoTeclado;

  const CampoTexto({
    super.key, 
    required this.etiqueta, 
    required this.textoAyuda, 
    required this.controller,
    required this.icono,
    this.tipoTeclado = TextInputType.text,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: tipoTeclado,
      decoration: InputDecoration(
        labelText: etiqueta,
        hintText: textoAyuda,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(icono),
        border: OutlineInputBorder(),
      ),
    );
  }
}