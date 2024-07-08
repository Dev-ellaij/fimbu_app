import 'package:timbu_app/model/product_itemmodel.dart';
// ignore: unused_import
import 'package:timbu_app/model/retail.model.dart';

class Retail {
  Retail({
    required this.items,
  });

  final List<Item> items;

  factory Retail.fromJson(Map<String, dynamic> json) {
    return Retail(
      items: json["items"] == null
          ? []
          : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "items": items.map((x) => x.toJson()).toList(),
      };

  // You may define a getter for products here if needed
  List<Item> get products => items;
}

// Assuming the `Item` class is defined in the `product_itemmodel.dart` file
