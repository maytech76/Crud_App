import 'package:flutter/material.dart';
import 'package:producto_app/models/models.dart';


class ProductFormProvider extends ChangeNotifier{
 
 GlobalKey<FormState> formkey = GlobalKey<FormState>();

 Products products;

 ProductFormProvider( this.products );

 bool isValidform(){


  return formkey.currentState?.validate()?? false;
 }


}