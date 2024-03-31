
import 'dart:io';

import 'package:flutter/material.dart';

class ProductEditImage extends StatelessWidget {

  final String? url;

  const ProductEditImage({  
  Key? key,
  this.url,
  }): super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( left: 10, right: 10, top: 10 ),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 400,
        child: Opacity(
          opacity: 0.8,
          child: ClipRRect(
            borderRadius: BorderRadius.only( topLeft: Radius.circular(38), topRight: Radius.circular(38) ),
            child: getImage(url)
            
          ),
        ),
      ),
      );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.only( topLeft: Radius.circular(38), topRight: Radius.circular(38) ),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 5)

      )
    ]
  );


  Widget getImage( String? picture ){


     if (picture == null) // Si es Nula Muestra Imagen por defecto en Assets
      return  Image(
              image: AssetImage('assets/no-image.png'),
              fit: BoxFit.cover,
              );
    
     if (picture.startsWith('http'))// Si inicia la ruta con http entonces aplicamos valor url

         return FadeInImage(
              image: NetworkImage(url!),
              placeholder: const AssetImage('assets/jar-loading.gif'),
              fit: BoxFit.cover,
               );

         return Image.file(
          File(picture),
          fit: BoxFit.cover,
         );   

  }

}
