import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:actividad_integradora_1/screens/detail_screen.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.computer),
        title: Text('EcoTech'),
        backgroundColor: Colors.greenAccent.shade700,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(12),
            ),

            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.green.shade50,
                  backgroundImage: AssetImage('assets/img/registro.png'),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Registro',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Registro de componentes de PC'),
                  ],
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),

            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'DATOS DEL PRODUCTO',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 160, 159, 159),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  TextField(
                    controller: _codController,
                    decoration: InputDecoration(
                      labelText: 'Código',
                      hintText: 'Ingrese el código',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.tag),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 10),

                  TextField(
                    controller: _nomController,
                    decoration: InputDecoration(
                      labelText: 'Nombre:',
                      hintText: 'Ingrese el nombre del producto',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.memory),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 10),

                  TextField(
                    controller: _canController,
                    decoration: InputDecoration(
                      labelText: 'Cantidad:',
                      hintText: '0',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.inventory_2_outlined),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 10),

                  TextField(
                    controller: _preController,
                    decoration: InputDecoration(
                      labelText: 'Precio:',
                      hintText: '0.00',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.attach_money),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 10),

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
                      hintStyle: TextStyle(color: Colors.grey),
                      alignLabelWithHint: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(bottom: 48),
                        child: Icon(Icons.notes),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        // validación
                        if (_codController.text.isEmpty ||_nomController.text.isEmpty ) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Completa los campos')),  
                          );
                          return;
                        }

                        //Crea objeto usando model importado
                        Componentes nuevoComponente = Componentes(
                          codigo: _codController.text, 
                          nombre: _nomController.text,
                          cantidad: _canController.text,
                          precio: _preController.text,
                          descripcion: _desController.text,
                        );

                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            //Pasa los datos del form a la segunda pantalla
                            builder: (context) => DetailScreen(
                              componenteRecibido: nuevoComponente,
                            ),
                          ),
                        );
                      },

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.save_outlined, size: 22),
                          SizedBox(width: 8),
                          Text('Guardar', style: TextStyle(fontSize: 19)),
                        ],
                      ), 
                      
                    ),
                  ),
                  SizedBox(height: 24,)
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
