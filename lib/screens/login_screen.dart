import 'package:flutter/material.dart';
import 'package:producto_app/Interfaces/input_decorations.dart';
import 'package:producto_app/providers/login_form_provider.dart';
import 'package:producto_app/services/services.dart';
import 'package:producto_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
                   const Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
                   const SizedBox(height: 30),

                   //Notificara si existen cambios en el formulario de login
                   ChangeNotifierProvider(
                    create: (_)=>LoginFormProvider(),
                    child:  _LoginFormulario()
                    )

                  
                ],
              ),
             ),
             
             const SizedBox(height: 50),
            TextButton(
              onPressed: () => Navigator.pushReplacementNamed(context, 'register'), 
              style:ButtonStyle(
                overlayColor: MaterialStateProperty.all(const Color.fromARGB(255, 3, 3, 248).withOpacity(0.1)),
                shape: MaterialStateProperty.all(const StadiumBorder() )
              ),
              child: const Text('Crear una Nueva Cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              )),

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

   //Almecenamos en la variable loginForm el acceso al metodo LoginFormProvider declarado en otro archivo pero esta dentro del mismo arbol
   final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        //TODO:mantener aqui la referencia al key
        key: loginForm.formkey,

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

              ////Al cambiar el valor del input email envia el nuevo valor
              onChanged: (value)=> loginForm.email = value,

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
              

              ////Al cambiar el valor del input password envia el nuevo valor
              onChanged: (value)=> loginForm.password = value,

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
              color: Color.fromARGB(255, 143, 4, 4),
                child: Container(
                  padding:  const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    loginForm.isLoading ? 'Esperar' : 'Ingresar', //Si se esta ejecutando la lectura show Esperar, caso contrario show Ingresar
                    style:  const TextStyle( color: Colors.white, fontSize: 20),
                  ),
                ),
              
              onPressed: loginForm.isLoading ? null : () async { //si se esta ejecutando la lectura boton desactivado caso contrario activado

                FocusScope.of(context).unfocus(); // si se ejecuta isloading ocultar teclado
                final authService = Provider.of<AuthService>(context, listen: false);

                 if (!loginForm.isValidForm()) return; //si NO es valida las credenciales en el form no hacer nada

                 loginForm.isLoading = true;

               

                //Validar si el login es correcto
                final String? errorMessage = await authService.login(loginForm.email, loginForm.password);

                  //Aplicamos una condicional si el mensaje de error es nulo, Direccionar al home

                  if (errorMessage == null) {
                    
                    Navigator.pushReplacementNamed(context, 'home'); // Caso contrario Llevar a la pantalla home
                  
                  }else{//Caso contrario Mostrar Error en pantalla
                    
                    /* print( errorMessage ); */
                    NotificationsService.showSnackbar(errorMessage);
                    loginForm.isLoading = false;

                 }
              })

          ],

        )
        )
    );
  }
}