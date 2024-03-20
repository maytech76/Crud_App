import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {

  
  final Widget child; 


const AuthBackground({
  Key? key,
  required this.child,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
   
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [

         _BlackBox(),

         _Icono(),

         child,

        ],
      ),

    );
  }
}

class _Icono extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Container(
       width: double.infinity,
       margin: const EdgeInsets.only(top:30),
       child: const Icon(Icons.person_pin, color: Colors.white, size: 100,),
     )
     );
  }
}

class _BlackBox extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height:size.height*0.4,
      decoration: _blackGradient(),
      child: Stack(
        children: [
            Positioned(top:40, left: 10,child: _Bubble(),),
            Positioned(top:110, left: 120,child: _Bubble(),),
            Positioned(top:10, left: 230,child: _Bubble(),),
            Positioned(top:190, left: 20,child: _Bubble(),),
            Positioned(top:190, left: 330,child: _Bubble(),),
        ],
      ),
    );
  }



  BoxDecoration _blackGradient() => const BoxDecoration(
    gradient:LinearGradient(
      colors: [
        Color.fromRGBO(42,42,42,100),
        Color.fromRGBO(0,0,0,100)

      ])
  );
}

class _Bubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromARGB(9, 222, 219, 219)
      ),

    );
  }
}