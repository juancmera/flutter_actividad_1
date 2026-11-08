import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
   
const MenuLateral({super.key});
  
  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;

    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: colores.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/img/logo.png', height: 60),
                const SizedBox(height: 8),
                Text(
                  'TechStore',
                  style: TextStyle(
                    color: colores.onPrimary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _opcion(context, Icons.home, 'Inicio', 'inicio'),
          _opcion(context, Icons.grid_view, 'Catálogo', 'catalogo'),
          _opcion(context, Icons.ad_units, 'Registro', 'registro')
        ],
      ),
    );
  }

  Widget _opcion(
      BuildContext context, IconData icono, String texto, String ruta) {
    return ListTile(
      leading: Icon(icono),
      title: Text(texto),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, ruta);
      },
    );
  }
}
