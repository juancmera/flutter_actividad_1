import 'package:actividad_integradora_1/providers/product_provider.dart';
import 'package:actividad_integradora_1/widgets/appbar_widget.dart';
import 'package:actividad_integradora_1/widgets/error_widget.dart';
import 'package:actividad_integradora_1/widgets/menu_widget.dart';
import 'package:actividad_integradora_1/widgets/producto_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogoScreen extends StatelessWidget {
   
const CatalogoScreen({super.key});

    // Nombres para las categorías de la API.
  static const Map<String, String> _nombres = {
    'laptops': 'Laptops',
    'tablets': 'Tablets',
    'mobile-accessories': 'Accesorios',
  };
  
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductosProvider>();

    return  Scaffold(
      appBar: const BarraDefault(),
      drawer: const MenuLateral(),

      body: Column(
        children: [
          _chips(provider),
          // Expanded: la grilla ocupa el resto de la pantalla
          Expanded(
            child: RefreshIndicator(
              onRefresh: provider.cargarProductos,
              child: _contenido(provider),
            ),
          ),
        ],
      ),
    );
  }

   // Fila de chips para filtrar por categoría.
  Widget _chips(ProductosProvider provider) {
    // scrollDirection horizontal: si no caben, se deslizan de lado.
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _chip(provider, null, 'Todos'),
          ...provider.categorias.map(
            (c) => _chip(provider, c, _nombres[c] ?? c),
          ),
        ],
      ),
    );
  }

  Widget _chip(ProductosProvider provider, String? categoria, String texto) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      // NUEVO — ChoiceChip: chip seleccionable (solo uno activo a la vez).
      child: ChoiceChip(
        label: Text(texto),
        selected: provider.categoriaSeleccionada == categoria,
        onSelected: (_) => provider.seleccionarCategoria(categoria),
      ),
    );
  }

  // Decide qué mostrar según el estado del provider.
  Widget _contenido(ProductosProvider provider) {
    // ---- Estado CARGANDO ----
    if (provider.cargando && provider.productos.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    // ---- Estado ERROR ----
    // Va dentro de un ListView para que el Pull-to-Refresh funcione.
    if (provider.error != null) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          const SizedBox(height: 80),
          VistaError(
            mensaje: provider.error!,
            onReintentar: provider.cargarProductos,
          ),
        ],
      );
    }

    // ---- Estado ÉXITO ----
    final lista = provider.productosFiltrados;

    // NUEVO — GridView.builder: cuadrícula que crea las tarjetas a
    // medida que se necesitan (eficiente con muchos elementos).
    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemCount: lista.length,
      // NUEVO — gridDelegate define la forma de la grilla:
      // 2 columnas, separación entre tarjetas y proporción ancho/alto.
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.68, // menor que 1 = tarjeta más alta que ancha
      ),
      itemBuilder: (_, index) => ProductoCard(producto: lista[index]),
    );
  }
}
