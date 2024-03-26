import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:producto_app/models/models.dart';
import 'package:producto_app/services/services.dart';
import 'package:http/http.dart' as http;


class ProductsService extends ChangeNotifier{
  final String _baseUrl='https://fluttercrud1-e9ad7-default-rtdb.firebaseio.com';

  final List<Products> products = [];

  //Desarrollar las peticiones fetch

  ProductsService(){

    loadProducts();
  }

 Future loadProducts() async{
   
   final url = Uri.https(_baseUrl, 'products.json');
   final resp = await http.get(url);

   //convertimos el Json recibido en un String 
   final Map<String, dynamic> productsMap = jsonDecode( resp.body );

   print(productsMap);

   

 }

 

}