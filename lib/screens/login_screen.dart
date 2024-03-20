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
        //TODO:mantener aqui la referencia
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