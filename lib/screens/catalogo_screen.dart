import 'package:actividad_integradora_1/providers/product_provider.dart';
import 'package:actividad_integradora_1/widgets/appbar_widget.dart';
import 'package:actividad_integradora_1/widgets/error_widget.dart';
import 'package:actividad_integradora_1/widgets/menu_widget.dart';
import 'package:actividad_integradora_1/widgets/producto_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogoScreen extends StatelessWidget {
   
const CatalogoScreen({super.key});

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

   //chips para filtrar por categoría.
  Widget _chips(ProductosProvider provider) {

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
      //seleccion uno activo a la vez
      child: ChoiceChip(
        label: Text(texto),
        selected: provider.categoriaSeleccionada == categoria,
        onSelected: (_) => provider.seleccionarCategoria(categoria),
      ),
    );
  }

  Widget _contenido(ProductosProvider provider) {
    // ---- Estado CARGANDO ----
    if (provider.cargando && provider.productos.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    //Estado ERROR
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

    //Estado ÉXITO
    final lista = provider.productosFiltrados;

    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemCount: lista.length,

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.68,
      ),
      itemBuilder: (_, index) => ProductoCard(producto: lista[index]),
    );
  }
}
