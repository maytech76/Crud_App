import 'package:flutter/material.dart';

class ProductEditImage extends StatelessWidget {
  const ProductEditImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( left: 10, right: 10, top: 10 ),
      child: Container(
        decoration: _buildBoxDecoration(),
        width: double.infinity,
        height: 400,
        child: const ClipRRect(
          borderRadius: BorderRadius.only( topLeft: Radius.circular(38), topRight: Radius.circular(38) ),
          child: FadeInImage(
            image: NetworkImage('https://via.placeholder.com/400x300/green'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fit: BoxFit.cover,
             ),
        ),
      ),
      );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.only( topLeft: Radius.circular(38), topRight: Radius.circular(38) ),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        offset: Offset(0, 5)

      )
    ]
  );
}