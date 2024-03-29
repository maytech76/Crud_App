
import 'dart:convert';

class Products {
    Products({
        required this.available,
        required this.name,
        this.picture,
        required this.price,
        this.id
    });

    bool available;
    String name;
    String? picture;
    double price;
    String? id;

    factory Products.fromJson(String str) => Products.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Products.fromMap(Map<String, dynamic> json) => Products(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
    };

     
    //Metodo que regresara un nuevo producto, permitiendo tomar esto datos
    //para envialos a la pantalla product_edit
    Products copy() => Products(
      available: available,
      name: name,
      picture: picture,
      price: price,
      id: id,
    );

}
