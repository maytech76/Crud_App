import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
   
  const LoadingScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Productos', style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
         child: CircularProgressIndicator(
          color: Color.fromARGB(255, 123, 10, 2),
         ),
      ),
    );
  }
}