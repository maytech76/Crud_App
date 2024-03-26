import 'package:flutter/material.dart';
import 'package:producto_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        centerTitle: true,
        title:const Text('Productos'),
      ),

      
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => ProductCard()
        
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:  const Color.fromARGB(255, 133, 10, 1),
           
          child: const Icon(Icons.add),
          onPressed:() {}
          ),
    );
  }
}