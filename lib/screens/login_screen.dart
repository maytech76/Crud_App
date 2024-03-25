import 'package:flutter/material.dart';
import 'package:producto_app/Interfaces/input_decorations.dart';
import 'package:producto_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
   
    const LoginScreen({Key? key}) : super(key: key); 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: AuthBackground(
      child: SingleChildScrollView(
        child: Column(
          children: [

             const SizedBox( height: 200 ),

             CardContainer( 
              child: Column(
                children: [
                   const SizedBox(height: 10),
                   const Text('Ingresar', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
                   const SizedBox(height: 30),

                   _LoginFormulario()
                ],
              ),
             ),
             
             const SizedBox(height: 50),
            const Text('Crear una Nueva Cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),)

          ],
        ),
       
      ),
     ),
    );
  }
}

class _LoginFormulario extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        //TODO:mantener aqui la referencia al key

        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [

            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Ingresa Correo Electrónico',
                labelText: 'Correo Electrónico',
                prefixIcon: Icons.alternate_email_rounded
              ),

              validator: (value) {

                  //Expresion Regular para validar el formato de email correcto en nuestro input (Email)
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);

                  return regExp.hasMatch(value ?? '') //Si lo ingresado hace mach con la expresion regular o esta vacia (retornar un null)
                  ? null 
                  
                  : 'Formato de Email NO VALIDO'; //caso contrario retornar el siguiente Mensaje

              },
            ),

            const SizedBox(height: 30),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '***************',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_clock_outlined
              ),

              validator: (value) {

                  //Condicion con funcion ternaria si elvalor es diferente a null y su long es mayor a 6 retorna un null
                 return (value != null && value.length >= 6) ? null

                  //caso contrario retorna el siguinete texto:
                 : 'La contraseña debe tener min 6 caracteres';

              },
            ),

            const SizedBox(height: 30),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: const Color.fromARGB(255, 2, 88, 5),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    'Ingresar', style: TextStyle( color: Colors.white, fontSize: 20),
                  ),
                ),
              
              onPressed: () {

              })

          ],

        )
        )
    );
  }
}