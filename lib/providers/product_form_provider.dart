import 'package:flutter/material.dart';
import 'package:producto_app/models/models.dart';


class ProductFormProvider extends ChangeNotifier{
 
 GlobalKey<FormState> formkey = GlobalKey<FormState>();

 Products products;

 ProductFormProvider( this.products );

 //Actualizar el estado del Producto Disponible true ó false
 updateAvaillability(bool value){
  print(value);
  this.products.available = value;
  notifyListeners(); //Para activarlo lo llamamos desde la pantalla product_edit_screen ( SwitchListTile )
 }

 bool isValidform(){

  print(products.name);
  print(products.price);
  print(products.available);


  return formkey.currentState?.validate()?? false;
 }


}