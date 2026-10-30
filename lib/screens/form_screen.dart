import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:actividad_integradora_1/rutes/app_routes.dart';
import 'package:actividad_integradora_1/theme/tema.dart';
import 'package:actividad_integradora_1/widgets/campo_widget.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controladores campos del form
  final _codController = TextEditingController();
  final _nomController = TextEditingController();
  final _canController = TextEditingController();
  final _preController = TextEditingController();
  final _desController = TextEditingController();

    //dispose() se ejecuta cuando la pantalla se cierra y libera los controladores para que no queden ocupando memoria.
  @override
  void dispose() {
    _codController.dispose();
    _nomController.dispose();
    _canController.dispose();
    _preController.dispose();
    _desController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    //String etiqueta;
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: TechStoreColors .navy900,
        foregroundColor: TechStoreColors.card,
        leading: Center(
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              gradient: TechStoreColors.goldGradient, //fondo con degradado
              borderRadius: BorderRadius.circular(TechStoreRadius.sm),
              
            ),
            child: Icon(
              Icons.laptop_outlined,
              color: TechStoreColors.navy900,
              size: 22,
            ),
          ),
        ),
        //titleSpacing es el espacio entre el leading y el título.
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TechStore',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Componentes de PC',
              style: TextStyle(fontSize: 12, color: TechStoreColors.muted),
            ),
          ],
        ),
      ),
 
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
         // ClipRRect recorta esquinas redondeadas.
          ClipRRect(
            borderRadius: BorderRadius.circular(TechStoreRadius.md),
            child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: TechStoreColors.card,
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: TechStoreColors.navy900,
                      borderRadius: BorderRadius.circular(TechStoreRadius.md),
                    ),
                    child: Icon(Icons.note_add_outlined, color: Colors.white),
                  ),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Registro',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: TechStoreColors.text,
                        ),
                      ),
                      Text(
                        'Registro de componentes de PC',
                        style: TextStyle(fontSize: 12, color: TechStoreColors.muted),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
 
          SizedBox(height: 12),
 
          //Formulario
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: TechStoreColors.card,
              borderRadius: BorderRadius.circular(TechStoreRadius.md),
              //Border.all dibuja una línea alrededor.
              border: Border.all(color: TechStoreColors.border),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                //Sstretch hace que los hijos ocupen todo el ancho.
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'DATOS DEL PRODUCTO',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: TechStoreColors.muted,
                      letterSpacing: 0.8, //separa entre letras
                    ),
                  ),
                  SizedBox(height: 14),

                  CampoTexto(
                    etiqueta: 'Código',
                    textoAyuda: 'Ej. PC-001',
                    controller: _codController,
                    icono: Icons.tag,
                  ),
                  SizedBox(height: 14),
 
                  CampoTexto(
                    etiqueta: 'Nombre',
                    textoAyuda: 'Ej. Procesador Ryzen 5 5600',
                    controller: _nomController,
                    icono: Icons.memory,
                  ),
                  SizedBox(height: 14),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Expanded el hijo ocupe el espacio libre de fila. 
                      Expanded(
                        child: CampoTexto(
                          etiqueta: 'Cantidad',
                          textoAyuda: '0',
                          controller: _canController,
                          icono: Icons.inventory_2_outlined,
                          tipoTeclado: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 12),
                      
                      Expanded(
                        child: CampoTexto(
                          etiqueta: 'Precio',
                          textoAyuda: '0.00',
                          controller: _preController,
                          icono: Icons.attach_money,
                          tipoTeclado: TextInputType.numberWithOptions(decimal: true),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),

                  TextFormField(
                    controller: _desController,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    minLines: 3,
                    maxLines: 5,
                    maxLength: 150,
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                      hintText: 'Características principales del componente',
                      helperStyle: TextStyle(color: TechStoreColors.muted),
                      alignLabelWithHint: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 48),
                        child: Icon(Icons.notes),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
 
                  //Botones
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 48,
                          //OutlinedButton, botón con borde y sin fondo
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: TechStoreColors.navy900,
                              //side define el color del borde del botón.
                              side: BorderSide(color: TechStoreColors.borderStrong),
                              //shape define la forma; aquí esquinas de 10.
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(TechStoreRadius.md),
                              ),
                            ),
                            onPressed: () {
                              //reset() borra los mensajes de error del Form.
                              _formKey.currentState!.reset();
                              //Clear() vacía el texto de cada controlador.
                              _codController.clear();
                              _nomController.clear();
                              _canController.clear();
                              _preController.clear();
                              _desController.clear();
                            },
                            child: Text(
                              'Limpiar',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 48,

                          child: FilledButton.icon(
                            style: FilledButton.styleFrom(
                              backgroundColor: TechStoreColors.navy900,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(TechStoreRadius.md),
                              ),
                            ),
                            onPressed: () {
                              // validación.
                              if (_codController.text.isEmpty ||
                                  _nomController.text.isEmpty ||
                                  _canController.text.isEmpty ||
                                  _preController.text.isEmpty ||
                                  _desController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Completa todos los campos')),
                                );
                                return;
                              }
 
                              //Crea objeto usando model
                              Componentes nuevoComponente = Componentes(
                                codigo: _codController.text,
                                nombre: _nomController.text,
                                cantidad: _canController.text,
                                precio: _preController.text,
                                descripcion: _desController.text,
                              );
 
                              /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //Pasa los datos del form al segunda pantalla
                                  builder: (context) => DetailScreen (
                                    componenteRecibido: nuevoComponente,
                                  ),
                                ),
                              );*/
                              Navigator.pushNamed(
                                context, AppRoutes .detalle, 
                                arguments: nuevoComponente
                              );

                            },
                            icon: Icon(Icons.save_outlined, size: 20),
                            label: Text(
                              'Guardar',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
 