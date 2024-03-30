import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:producto_app/models/models.dart';
import 'package:http/http.dart' as http;


class ProductsService extends ChangeNotifier{

  final String _baseUrl='fluttercrud1-e9ad7-default-rtdb.firebaseio.com';
  final List<Products> products = [];

  //Propiedad que contiene datos del producto seleccionado en pro a edicion
    late Products selectedProduct;



    bool isloading = true;

    bool isSaving = false;

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

  //Nuevo metodo para Crear ó Actualizar datos de registro

  Future saveorCreateProduct(Products products) async{

    isSaving = true;
    notifyListeners();

     if (products.id == null) {
       //llamamos el Metodo createProduct y Registramos nuevo producto
       await createProduct(products);

     }else{
       // Actualizamos Producto Selecionado por id
       await updateProduct(products);
     }
    

    isSaving = false;
    notifyListeners();
  }

  //Promesa que al ejecutarse Actulizara los datos de nuestro producto con sus nuevos valores
  Future<String>updateProduct( Products products ) async{
     
     final url = Uri.https(_baseUrl, 'products/${products.id}.json');
     final resp = await http.put(url, body: products.toJson());
     final decodedData = resp.body;


     print(decodedData);


     //Actualizar el listado de productos
     //Variable INDEX que almacena el indice del producto selecionado en la edicion
     final index = this.products.indexWhere((element) => element.id == products.id);
     this.products[index] = products;

     return products.id!;
     
  }

  //Promesa que al ejecutarse Creara un nuevo producto con sus  valores
  Future<String>createProduct( Products products ) async {
     
     final url = Uri.https( _baseUrl, 'products/.json' );
     final resp = await http.post( url, body: products.toJson() );
     final decodedData = json.decode(resp.body);

     products.id = decodedData['name'];
     
     this.products.add(products);
      
     return products.id!;
     
  }


   

 }

 

