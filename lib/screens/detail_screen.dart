import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:actividad_integradora_1/theme/tema.dart';
import 'package:actividad_integradora_1/widgets/dato_widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Componentes componenteRecibido;

  const DetailScreen({super.key, required this.componenteRecibido});

  @override
  Widget build(BuildContext context) {

    //Convierten texto a número para calculo unidad x precio = total, ?? verifica si es null agrega 0.
    final int cantidad = int.tryParse(componenteRecibido.cantidad) ?? 0;
    final double precio = double.tryParse(componenteRecibido.precio) ?? 0;
    final double total = cantidad * precio;

    return Scaffold(
      appBar: AppBar(
        //Se agregan dos widgets para TechStore descripción
        toolbarHeight: 64,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TechStore', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Detalle del registro', style: TextStyle(fontSize: 12, color: TechStoreColors .muted2),
            ),
          ],
        ),
      ),

      // La pantalla se divide en dos partes: el contenido (con scroll) y los botones fijos abajo.
      body: Column(
        children: [
          // Expanded el ListView ocupa todo el alto y los botones al final.
          
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                // ---------- Banner de éxito ----------
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: TechStoreColors.greenBg,
                    borderRadius: BorderRadius.circular(TechStoreRadius.md),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 19,
                        backgroundColor: TechStoreColors.green,
                        child: Icon(Icons.check, color: Colors.white),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Componente registrado',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: TechStoreColors.green,
                            ),
                          ),
                          Text(
                            'Los datos se guardaron correctamente.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
 
                // ---------- Tarjeta del componente ----------
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: TechStoreColors.card,
                    borderRadius: BorderRadius.circular(TechStoreRadius.md),
                    border: Border.all(color: TechStoreColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Ícono + nombre + código
                      Row(
                        children: [
                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: TechStoreColors.navy900,
                              borderRadius:
                                  BorderRadius.circular(TechStoreRadius.md),
                            ),
                            child: Icon(Icons.memory, color: TechStoreColors.gold),
                          ),
                          SizedBox(width: 12),
                          // Expanded: si el nombre es largo, baja de línea
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  componenteRecibido.nombre,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: TechStoreColors.background,
                                    borderRadius: BorderRadius.circular(
                                      TechStoreRadius.full,
                                    ),
                                  ),
                                  // NUEVO: ${...} inserta una variable en el texto;
                                  // monospace = letra de ancho fijo.
                                  child: Text(
                                    '# ${componenteRecibido.codigo}',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: 'monospace',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
 
                      // NUEVO: Divider dibuja una línea horizontal; height es el
                      // espacio total que ocupa (línea + espacio arriba y abajo).
                      Divider(height: 28, color: TechStoreColors.border),
 
                      // Cantidad y Precio en dos columnas iguales
                      Row(
                        children: [
                          Expanded(
                            child: DatoDetalle (
                              icono: Icons.inventory_2_outlined,
                              etiqueta: 'CANTIDAD',
                              valor: '$cantidad',
                            ),
                          ),
                          Expanded(
                            child: DatoDetalle(
                              icono: Icons.attach_money,
                              etiqueta: 'PRECIO UNITARIO',
                              // NUEVO: toStringAsFixed(2) = siempre 2 decimales;
                              // \$ escribe el símbolo sin confundirlo con variable.
                              valor: '\$ ${precio.toStringAsFixed(2)}',
                            ),
                          ),
                        ],
                      ),
 
                      // Total: caja redondeada con márgenes
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 14),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: TechStoreColors.amberBg,
                          borderRadius: BorderRadius.circular(TechStoreRadius.sm),
                        ),
                        child: Row(
                          // NUEVO: spaceBetween = uno a la izquierda y otro a la derecha
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TOTAL',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: TechStoreColors.amber,
                              ),
                            ),
                            Text(
                              '\$ ${total.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
 
                      DatoDetalle(
                        icono: Icons.notes,
                        etiqueta: 'DESCRIPCIÓN',
                        // Si está vacía, muestra un aviso
                        valor: componenteRecibido.descripcion.isEmpty
                            ? 'Sin descripción'
                            : componenteRecibido.descripcion,
                        negrita: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


           
          // =====================================================
          // BOTONES FIJOS ABAJO
          // =====================================================
          // NUEVO: SafeArea evita que los botones queden debajo de la
          // barra de gestos o de los botones del sistema del teléfono.
          SafeArea(
            top: false, // solo protege el borde inferior
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 48,
                    child: FilledButton.icon(
                      style: FilledButton.styleFrom(
                        backgroundColor: TechStoreColors .navy900,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(TechStoreRadius.md),
                        ),
                      ),
                      // NUEVO: Navigator.pop cierra esta pantalla y vuelve
                      // a la anterior (FormScreen).
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.add, size: 20),
                      label: Text(
                        'Registrar otro componente',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 48,
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: TechStoreColors.navy900,
                        side: BorderSide(color: TechStoreColors.borderStrong),
                        backgroundColor: TechStoreColors.card,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(TechStoreRadius.md),
                        ),
                      ),
                      // NUEVO: popUntil cierra pantallas hasta llegar a la que
                      // cumple la condición; isFirst = la primera de la app.
                      // Hoy equivale a pop (solo hay 2 pantallas), pero sirve
                      // cuando se agregue la pantalla de inventario.
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      icon: Icon(Icons.home_outlined, size: 20),
                      label: Text(
                        'Volver al inicio',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 