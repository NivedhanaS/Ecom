import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    required this.pid,
    required this.imgurl,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.sellerId,
    required this.gst,
    this.isLiked = false,
  });

  String pid;
  String imgurl;
  String name;
  String description;
  String price;
  String categoryId;
  String sellerId;
  String gst;
  bool isLiked;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        pid: json["pid"].toString(),
        imgurl: json["imgurl"],
        name: json["name"],
        description: json["description"],
        price: json["price"].toString(),
        categoryId: json["category_id"].toString(),
        sellerId: json["seller_id"].toString(),
        gst: json["gst"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "imgurl": imgurl,
        "name": name,
        "description": description,
        "price": price,
        "category_id": categoryId,
        "seller_id": sellerId,
        "gst": gst,
      };
}
