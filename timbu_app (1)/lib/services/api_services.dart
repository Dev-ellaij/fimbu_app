import 'dart:convert';

import 'package:fimbu_mobile/model/product_model.dart';
import 'package:http/http.dart' as http;

class FimbuServices {
  static const BASE_URL = 'https://api.timbu.cloud/products';
  final String api_key;
  final String app_id;
  final String organization_id;

  FimbuServices(
      {required this.api_key,
      required this.app_id,
      required this.organization_id});
  Future<Product> getProduct() async {
    final response = await http.get(Uri.parse(
        '$BASE_URL?organization_id=$organization_id&Appid=$app_id&Apikey=$api_key'));
    //print("response: ${response.body}");
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get retail products');
    }
  }
}
