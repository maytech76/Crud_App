import 'package:flutter/material.dart';
import 'package:producto_app/screens/screens.dart';
/* import 'package:provider/provider.dart'; */


void main() { runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'home',
      routes: {
        'login': (_)=> const LoginScreen(),
        'home': (_)=> const HomeScreen(),
      },

      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[350]
      ),
    );
  }
}

