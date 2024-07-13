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
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get retail products');
    }
  }
}

void main() async {
  String apiKey = 'dcb2b39abd57451d96fd4bf0c2ee9fab20240713235028800994';
  String appId = '7NQZGUWZW0V0CXF';
  String organizationId = '130aabfbdb984194a0d89870742c05dc';

  FimbuServices fimbuServices = FimbuServices(
    api_key: apiKey,
    app_id: appId,
    organization_id: organizationId,
  );

  try {
    Product product = await fimbuServices.getProduct();
    print('Product: ${product.name}'); 
  } catch (e) {
    print(e);
  }
}
