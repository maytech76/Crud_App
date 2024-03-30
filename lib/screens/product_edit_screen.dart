
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:producto_app/Interfaces/input_decorations.dart';
import 'package:producto_app/providers/product_form_provider.dart';
import 'package:producto_app/services/services.dart';
import 'package:producto_app/widgets/widgets.dart';
import 'package:provider/provider.dart';



class ProductEditScreen extends StatelessWidget {


  const ProductEditScreen({super.key});

  
  @override
  Widget build(BuildContext context) {

  final productService = Provider.of<ProductsService>(context);

  return ChangeNotifierProvider(

    create: (_) => ProductFormProvider(productService.selectedProduct),
    child:  _ProductScreenBody(productService: productService),

  );


    //
  }
}



class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    super.key,
    required this.productService,
  });

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {


   // Creamos la referencia a ProductFormProvider
   final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
    
            Stack(
              children: [
                 ProductEditImage(url:productService.selectedProduct.picture),
    
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
    
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.save_outlined, color: Colors.white),
        
        onPressed:()async {

              if (!productForm.isValidform()) return;

              await productService.saveorCreateProduct(productForm.products);

           }
         ),
    );
  }
}



class _ProductEditForm extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final productForm = Provider.of<ProductFormProvider>(context);
    final prod = productForm.products;


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration:  _buildBoxDecoration(),

        //Diseñamos el Formulario
        child: Form(

          //Enviamos argumentos a nuestra edicion de producto
          key: productForm.formkey,

            //Activamos la Auto Validadcion cuando inicie el usuario interacion con el formulario
            autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [

              const SizedBox(height: 10),

              TextFormField(

               //Valor inicial desde product_card
               initialValue: prod.name,

               //al Cambiar el Valor sera el nuevo valor introducido por usuario
               onChanged: (value) => prod.name=value,

               //Validacion por null ó caracter min = 1
               validator: (value) {
                    // ignore: prefer_is_empty
                 if (value == null || value.length <1) {
                   return 'El Nombre es Obligatorio';
                 }
                 
               },
               decoration: InputDecorations.authInputDecoration(
                hintText: 'Nombre del producto',
                labelText: 'Nombre:')
              ),

              const SizedBox(height:10),

              TextFormField(

                 //Valor inicial desde product_card
               initialValue:'${ prod.price }',


               //Solo Mostrar teclado numerico
               keyboardType: TextInputType.number,

               //Validacion por formato de Caracteres aceptados
               inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
               ],

               //al Cambiar el Valor sera el nuevo valor introducido por usuario
               onChanged: (value) {
                if ( double.tryParse(value)==null ){
                  prod.price = 0;
                  
                }else{
                  prod.price = double.parse(value);
                }
               },

          
               decoration: InputDecorations.authInputDecoration(
                hintText: '\$150',
                labelText: 'Precio:'
                ),
              ),


              SwitchListTile.adaptive(
                value: prod.available,
                title: Text('Disponible'),
                activeColor: Colors.indigo, 
                onChanged: (value) => productForm.updateAvaillability(value)
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