import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:producto_app/models/models.dart';

class ProductCard extends StatelessWidget {
  
  final Products products;

  const ProductCard({
    Key? key,
     required this.products
     }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),

        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(products.picture),

            _ProductDetails(
              title: products.name,
              subTitle: products.id!,
            ),

            Positioned(
              top:0,
              right: 0,
              child: _PriceTag(products.price)
            ),

            //Mostrar si cumple condiciones de stock
            if ( !products.available )
            Positioned(
              top:0,
              left: 0,
              child: _availableProduct()
            ),
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
 
  final double price;

  const _PriceTag( this.price );

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
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('\$$price', style: const TextStyle(color: Colors.white, fontSize: 15))
          ),
      ),
    );
  }
}


class _ProductDetails extends StatelessWidget {

  final String title;
  final String subTitle;

  const _ProductDetails({
    required this.title,
    required this.subTitle
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
      width: double.infinity,
      height: 55,
      
      decoration: _buildBoxDecoration(),
       
      child: Column(
         
        crossAxisAlignment: CrossAxisAlignment.center,
       
        children: [
           
          Text(
           title,
           style: const TextStyle( fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold ),
          maxLines: 1, overflow: TextOverflow.ellipsis,
          ),
          Text(
          subTitle,
           style: const TextStyle(fontSize: 13, color: Color.fromARGB(255, 200, 198, 198), ),
         
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
  
  final String? url;

  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
          height: 400,
           child: url == null
           ? const Image(
            image: AssetImage('assets/no-image.png'),
            fit: BoxFit.cover            
            )
           
           //Caso contrario
           :FadeInImage(

             placeholder: const AssetImage('assets/jar-loading.gif'),
             image: NetworkImage(url!),
             fit: BoxFit.cover,
    
           ),
      ),
    );
  }
}