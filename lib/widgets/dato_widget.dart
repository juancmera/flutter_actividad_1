import 'package:actividad_integradora_1/theme/tema.dart';
import 'package:flutter/material.dart';

class DatoDetalle extends StatelessWidget {
  final IconData icono;
  final String etiqueta;
  final String valor;
  final bool negrita; // true: valor grande en negrita / false: texto normal

  const DatoDetalle({
    super.key,
    required this.icono,
    required this.etiqueta,
    required this.valor,
    this.negrita = true, // Opcional: por defecto, en negrita
  });

  @override
  Widget build(BuildContext context) {
    final colorEtiqueta = TechStoreColors.muted;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Text.rich con WidgetSpan pone icono en una línea de texto, sin necesidad de un Row.
        Text.rich(
          TextSpan(
            children: [
              WidgetSpan(
                //alignment: .middle centra el icono con el texto.
                alignment: PlaceholderAlignment.middle,
                child: Icon(icono, size: 14, color: colorEtiqueta),
              ),
              TextSpan(text: '  $etiqueta'),
            ],
          ),
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: colorEtiqueta,
            letterSpacing: 0.6,
          ),
        ),
        SizedBox(height: 4),
        Text(
          valor,
          //elige el estilo.
          style: negrita
              ? TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: TechStoreColors.text,
                )
              : TextStyle(
                  fontSize: 14,
                  height: 1.45,
                  color: TechStoreColors.text2,
                ),
        ),
      ],
    );
  }
}
