// ignore: unused_import
import 'package:timbu_app/model/price.model.dart';

class CurrentPrice {
  CurrentPrice({
    required this.usd,
  });

  final List<dynamic> usd;

  factory CurrentPrice.fromJson(Map<String, dynamic> json) {
    return CurrentPrice(
      usd: json["USD"] == null
          ? []
          : List<dynamic>.from(json["USD"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "USD": usd.map((x) => x).toList(),
      };
}
