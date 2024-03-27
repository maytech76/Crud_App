import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:producto_app/models/models.dart';
import 'package:http/http.dart' as http;


class ProductsService extends ChangeNotifier{

  final String _baseUrl='fluttercrud1-e9ad7-default-rtdb.firebaseio.com';
   final List<Products> products = [];
    bool isloading = true;

  //Desarrollar las peticiones fetch

  ProductsService(){

    loadProducts();
  }


 Future<List<Products>>loadProducts() async{

  isloading = true;
  notifyListeners();
   
   final url = Uri.https(_baseUrl, 'products.json');
   final resp = await http.get(url);

   //convertimos el Json lo recibido en un String 
   final Map<String, dynamic> productsMap = json.decode( resp.body );

   productsMap.forEach((key, value) { 
    final tempProduct = Products.fromMap(value);
    tempProduct.id = key;
    products.add( tempProduct );
   });

   isloading = false; 
     notifyListeners();
      return products;

   

 }

 

}