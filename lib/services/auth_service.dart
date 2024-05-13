import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class AuthService extends ChangeNotifier{

//Variable donde Almacenamos nuestra url API Create new User
final String _baseUrl = 'identitytoolkit.googleapis.com';

//Tonken de nuestra cuenta de FireBase
final String _firebaseToken = ' AIzaSyAMMlzgVQdgeESZUDYpq8P2noJDBeOo8eg ';




//Creamos el metodo para crear Usuarios usando el metodo POST 
//Utilizando los parametros necesarios
Future<String?>createUser( String email, String password ) async {

  
  final Map<String, dynamic> authData = {
    'email': email,
    'password': password
  };


  final url = Uri.https(_baseUrl, 'v1/accounts:signUp', {'key': _firebaseToken});

  final resp = await http.post(url, body: json.encode(authData));//Ejecutamos la peticion http POST createUser

  final Map<String, dynamic> decodedResp = json.decode( resp.body );//Descodificamos el JSON

  print( decodedResp );

  




}




}
