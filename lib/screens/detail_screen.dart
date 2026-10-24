import 'package:actividad_integradora_1/models/product_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Componentes componenteRecibido;

  const DetailScreen({super.key, required this.componenteRecibido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.computer),
        title: Text('EcoTech'),
        backgroundColor: Colors.greenAccent.shade700,
        foregroundColor: Colors.white,
      ),


      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/img/ok.png'),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Componente registrado',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Los datos se guardaron correctamente'),
                    ],
                  ),
                ],
              ),
            ),

            Card(
              margin: EdgeInsets.all(20),
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.grey.shade100,
           
              child: Padding(
                padding: EdgeInsets.all(16.0),
              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Icon(Icons.memory, size: 20, color: Colors.blueGrey),
                        SizedBox(width: 8),
                        Text(
                          componenteRecibido.nombre,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    Row(
                      children: [
                        Icon(Icons.inventory_2_outlined, size: 20, color: Colors.blueGrey),
                        SizedBox(width: 8),
                        Text(
                          componenteRecibido.precio,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    Row(
                      children: [
                        Icon(Icons.attach_money, size: 20, color: Colors.blueGrey),
                        SizedBox(width: 8),
                        Text(
                          componenteRecibido.cantidad,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.notes, size: 20, color: Colors.blueGrey),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            componenteRecibido.descripcion,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                  ],
                ),

              )

              
            ),

            SizedBox(
              width: double.infinity,
              height: 48,
              
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade600,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context); // Regresa al formulario
                },
                child: const Text('Registrar otro componente', 
                  style: TextStyle(fontSize: 16)
                ),
              ),
            ),

          ],

        ),
      )

    );
  }
}
