import 'package:actividad_integradora_1/theme/tema.dart';
import 'package:flutter/material.dart';

class BarraDefault extends StatelessWidget implements PreferredSizeWidget {
   
const BarraDefault({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      backgroundColor: TechStoreColors.navy900,
      foregroundColor: TechStoreColors.card,
      titleSpacing: 0,

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'TechStore',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Componentes de PC',
            style: TextStyle(
              fontSize: 12,
              color: TechStoreColors.muted,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
