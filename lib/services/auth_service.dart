import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';   //importamos json
import 'package:http/http.dart' as http; //Importamos el paquete http


class AuthService extends ChangeNotifier{

//Variable donde Almacenamos nuestra url API Create new User
final String _baseUrl = 'identitytoolkit.googleapis.com';


//Tonken de acceso a nuestra API de FireBase
final String _firebaseToken = ' AIzaSyAMMlzgVQdgeESZUDYpq8P2noJDBeOo8eg ';


//implemenetamos el secure storage en nuestros servicios
final storage = const FlutterSecureStorage();




  //Creamos el metodo para crear Usuarios usando el metodo POST 
  //Utilizando los parametros de tipo String necesarios que recibiremos 
  Future<String?>createUser( String email, String password ) async {

    
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };


    // declaramos la variable url asignandole la url necesaria para realizar la peticion post al backend
    final url = Uri.https(_baseUrl, 'v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));//Ejecutamos la peticion http POST createUser con el body en formato json email y password

    final Map<String, dynamic> decodedResp = json.decode( resp.body );//Descodificamos el JSON

    //Si al ejecutar la funcion createUser optenemos de respuesta el idToken
    if (decodedResp.containsKey('idToken')) {

      //Almacenamos el token en storage seguro local
      await storage.write(key: 'token', value: decodedResp['idToken'] );

      return null;
    }else{ //caso contrario mostramos error

        return decodedResp['error']['message'];
    }

    




  }


  Future<String?>login( String email, String password ) async {

    
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };


    // declaramos la variable url asignandole la url necesaria para realizar la peticion post al backend
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));//Ejecutamos la peticion http POST createUser con el body en formato json email y password

    final Map<String, dynamic> decodedResp = json.decode( resp.body );//Descodificamos el JSON

  

    //Si al ejecutar la funcion createUser optenemos de respuesta el idToken
    if (decodedResp.containsKey('idToken')) {

       //Almacenamos el token en storage seguro local
      await storage.write(key: 'token', value: decodedResp['idToken'] );


        return null;
      }else{ //caso contrario mostramos error

          return decodedResp['error']['message'];
    }
 

  }

    //Eliminamos el token almacenado ideal para el logout y llevar al usuario de nuevo al login
    Future logout() async{
      await storage.delete(key: 'token');

      return;
    }


    //Verificamos si al inicial session ya contamos con un token
    Future<String> readToken() async{
      return await storage.read(key: 'token') ?? '';
    }


}
