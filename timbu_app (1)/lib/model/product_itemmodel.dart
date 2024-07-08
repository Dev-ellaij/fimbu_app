import 'package:timbu_app/model/photo_model.dart';
import 'package:timbu_app/model/price.model.dart';

class Item {
  Item({
    required this.name,
    required this.description,
    required this.uniqueId,
    required this.urlSlug,
    required this.id,
    required this.userId,
    required this.photos,
    required this.currentPrice,
    required this.availableQuantity,
  });

  final String? name;
  final dynamic description;
  final String? uniqueId;
  final String? urlSlug;
  final String? id;
  final String? userId;
  final List<Photo> photos;
  final List<CurrentPrice> currentPrice;
  final double availableQuantity;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json["name"] as String?,
      description: json["description"],
      uniqueId: json["unique_id"] as String?,
      urlSlug: json["url_slug"] as String?,
      id: json["id"] as String?,
      userId: json["user_id"] as String?,
      photos: json["photos"] == null
          ? []
          : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      currentPrice: json["current_price"] == null
          ? []
          : List<CurrentPrice>.from(
              json["current_price"]!.map((x) => CurrentPrice.fromJson(x))),
      availableQuantity: (json["available_quantity"] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "unique_id": uniqueId,
        "url_slug": urlSlug,
        "id": id,
        "user_id": userId,
        "photos": photos.map((x) => x.toJson()).toList(),
        "current_price": currentPrice.map((x) => x.toJson()).toList(),
        "available_quantity": availableQuantity,
      };
}
