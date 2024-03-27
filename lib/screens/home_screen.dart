import 'package:flutter/material.dart';
import 'package:producto_app/screens/loading_screen.dart';
import 'package:producto_app/services/products_service.dart';
import 'package:producto_app/widgets/widgets.dart';
import 'package:provider/provider.dart';




class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override 
  Widget build(BuildContext context) {

   final productsService = Provider.of<ProductsService>(context); 

   if (productsService.isloading) return const LoadingScreen();

  

    return Scaffold(
    appBar: AppBar(
        centerTitle: true,
        title: Text('Productos', style: TextStyle(color: Colors.white)),
      ),

      
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'productedit'),
          child: ProductCard(
            products: productsService.products[index],
          )),
        
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:  const Color.fromARGB(255, 133, 10, 1),
           
          child: const Icon(Icons.add),
          onPressed:() {}
          ),
    );
  }
}