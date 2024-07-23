import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasktask/model/productmodel.dart';

class ProductService {
  final String BASE_URL;
  final String apiKey;
  final String appId;
  final String organizationId;

  ProductService(
      {required this.BASE_URL,
      required this.apiKey,
      required this.appId,
      required this.organizationId});
  Future<Product> getProduct() async {
    final response = await http.get(Uri.parse(
        '$BASE_URL?organization_id=$organizationId&Appid=$appId&Apikey=$apiKey'));
    //print('response: ${response.body}');
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get product items...');
    }
  }
}
