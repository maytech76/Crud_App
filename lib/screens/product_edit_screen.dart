import 'package:flutter/material.dart';
import 'package:producto_app/Interfaces/input_decorations.dart';
import 'package:producto_app/widgets/widgets.dart';


class ProductEditScreen extends StatelessWidget {
  const ProductEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [
                const ProductEditImage(),

                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                     icon: const Icon(Icons.arrow_back_ios_new, size: 40, color: Colors.white,)
                  )
                ),

                Positioned(
                  top: 50,
                  right: 20,
                  child: IconButton(
                    onPressed: () {

                    },
                     icon: const Icon(Icons.camera_alt_outlined, size: 40, color: Colors.white,)
                  )
                ),
              ],
            ),

            //Diseñamos el Formulario

            _ProductEditForm(),

            const SizedBox( height: 100 ),

          ],
          
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.save_outlined, color: Colors.white),
        
        onPressed:() {
          
           }
         ),
    );
  }
}

class _ProductEditForm extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration:  _buildBoxDecoration(),

        //Diseñamos el Formulario
        child: Form(
          child: Column(
            children: [

              const SizedBox(height: 10),

              TextFormField(
               decoration: InputDecorations.authInputDecoration(
                hintText: 'Nombre del producto',
                labelText: 'Nombre:')
              ),

              const SizedBox(height:30),

              TextFormField(
                keyboardType: TextInputType.number,
               decoration: InputDecorations.authInputDecoration(
                hintText: '\$150',
                labelText: 'Precio:'
                ),
              ),

              SwitchListTile.adaptive(
                value: true,
                title: Text('Disponible'),
                activeColor: Colors.indigo, 
                onChanged: (value){

                 } 
                
                ),
             
              const SizedBox(height:30),


            ],
          )),
    
    
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(
      bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      boxShadow:[
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          offset: const Offset(0, 8),
          blurRadius: 1
        )
      ]
  );
}