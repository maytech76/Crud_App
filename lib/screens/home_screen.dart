import 'package:flutter/material.dart';
import 'package:producto_app/models/models.dart';
import 'package:producto_app/screens/screens.dart';
import 'package:producto_app/services/services.dart';
import 'package:producto_app/widgets/widgets.dart';
import 'package:provider/provider.dart';




class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override 
  Widget build(BuildContext context) {

   final productsService = Provider.of<ProductsService>(context); 

   //Llamamos a la instancia AthService
   final authService = Provider.of<AuthService>(context, listen: false);

   if (productsService.isloading) return const LoadingScreen();

  

    return Scaffold(
    appBar: AppBar(
        centerTitle: true,
        title: Text('Productos', style: TextStyle(color: Colors.white)),
         leading: IconButton(
           icon: Icon( Icons.login_outlined, color: Colors.white),
            onPressed: (){
              authService.logout();

              Navigator.pushReplacementNamed(context, 'login');
          } 
          ),
      ),

      
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(

          onTap: () {//enviamos los datos del producto que recibe el tap a la pantalla productedit
            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'productedit');
          },
          child: ProductCard(
            products: productsService.products[index],
          )),
        
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:  const Color.fromARGB(255, 133, 10, 1),
           
          child: const Icon(Icons.add),
          onPressed:() {

            productsService.selectedProduct = Products(
              name: '', 
              price: 0, 
              available: false);

              Navigator.pushNamed(context, 'product');

            }
          ),
    );
  }
}