import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),

        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(),

            _ProductDetails(),

            Positioned(
              top:0,
              right: 0,
              child: _PriceTag()
            ),

            //Mostrar si cumple condiciones de stock
            Positioned(
              top:0,
              left: 0,
              child: _availableProduct()
            )
          ],
        ),
    
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
    color: const Color.fromARGB(255, 129, 192, 243),
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        offset: Offset(0,6),
        blurRadius: 10,
      )

    ]

  );
}

class _availableProduct extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 231, 235, 6),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(15))
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('No Disponible', style: TextStyle(color: Colors.black, fontSize: 15))
          ),
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomLeft: Radius.circular(15))
      ),
      child: const FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$ 103.99', style: TextStyle(color: Colors.white, fontSize: 15))
          ),
      ),
    );
  }
}


class _ProductDetails extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
      width: double.infinity,
      height: 50,
      
      decoration: _buildBoxDecoration(),
       
      child: const Column(
         
        crossAxisAlignment: CrossAxisAlignment.center,
       
        children: [
           
          Text('Disco Duro SSD',
           style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold ),
          maxLines: 1, overflow: TextOverflow.ellipsis,
          ),
          Text('Dettales del Disco',
           style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 200, 198, 198), ),
         
          )
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
   color: const Color.fromARGB(255, 72, 5, 1),
   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
   
  );
}


class _BackgroundImage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
          height: 400,
           child: FadeInImage(
             placeholder: AssetImage('assets/jar-loading.gif'),
             image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
             fit: BoxFit.cover,
    
           ),
      ),
    );
  }
}