// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:producto_app/screens/screens.dart';
import 'package:producto_app/services/services.dart';
import 'package:provider/provider.dart'; 


void main() { runApp(AppState());
}
class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ProductsService())
      ],

      child: MyApp(),
    );
  }
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      routes: {
        'login': (_) =>  LoginScreen(),
        'register': (_) => RegisterScreen(),
        'home': (_) =>  HomeScreen(),
        'productedit': (_) =>   ProductEditScreen(),
        'product':(_) =>  ProductEditScreen(),
      },

      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[350],
        appBarTheme: const AppBarTheme(
          elevation: 1,
          color: Color.fromARGB(255, 133, 10, 1),
           
        )
      ),
    );
  }
}

