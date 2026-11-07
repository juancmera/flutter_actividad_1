
import 'package:actividad_integradora_1/providers/product_provider.dart';
import 'package:actividad_integradora_1/widgets/appbar_widget.dart';
import 'package:actividad_integradora_1/widgets/card_swiper.dart';
import 'package:actividad_integradora_1/widgets/error_widget.dart';
import 'package:actividad_integradora_1/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = context.watch<ProductosProvider>();


    return  Scaffold(
      appBar: const BarraDefault(),
      drawer: const MenuLateral(),

      body: RefreshIndicator(
        onRefresh: provider.cargarProductos,

        // contenido
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            _contenido(context, provider, size),
          ],
        ),
      ),
    );
  }

  Widget _contenido(
      BuildContext context, ProductosProvider provider, Size size) {
    // ---- Estado CARGANDO ----
    // spinner si aún no hay datos y si ya hay productos (Pull-to-Refresh.
    if (provider.cargando && provider.productos.isEmpty) {
      return SizedBox(
        height: size.height * 0.7,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    // ---- Estado ERROR ----
    if (provider.error != null) {
      return SizedBox(
        height: size.height * 0.7,
        child: VistaError (
          mensaje: provider.error!, // "!" : aquí sabemos que no es null
          onReintentar: provider.cargarProductos,
        ),
      );
    }

    // ---- Estado ÉXITO ----
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Mejor valorados',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        CardSwiper(size: size, productos: provider.destacados),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton.icon(
            // Navegación a Catálogo
            onPressed: () => Navigator.pushNamed(context, 'catalogo'),
            icon: const Icon(Icons.grid_view),
            label: Text('Ver catálogo (${provider.productos.length})'),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
