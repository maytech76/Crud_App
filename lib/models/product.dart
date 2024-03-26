import 'dart:convert';

class Products {
    bool available;
    String name;
    String picture;
    double price;

    Products({
        required this.available,
        required this.name,
         required this.picture,
        required this.price,
    });

    factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
    };
}
