// ignore_for_file: avoid_print

import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as https;

import 'package:timbu_app/model/retail.model.dart';

class RetailServices {
  // ignore: constant_identifier_names
  static const BASE_URL = 'https://api.timbu.cloud/products';
  final String apiKey;
  final String appId;
  final String organizationId;

  RetailServices({
    required this.apiKey,
    required this.appId,
    required this.organizationId,
  });

  Future<Retail> getRetail() async {
    var http;
    final response = await http.get(
      Uri.parse(
        '$BASE_URL?organization_id=$organizationId&Appid=$appId&Apikey=$apiKey',
      ),
    );

    //print("response: ${response.body}");
    if (response.statusCode == 200) {
      return Retail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get retail products');
    }
  }
}

void main() async {
  // Replace the following values with the new ones
  const apiKey = '0dbb029f49af47ba9cc04ebc42f52bd920240704224551174276';
  const appId = 'PRAUPJQ0W8BUQFJ';
  const organizationId = '2363e2ffb84c46078dd934850de133a1';

  final retailServices = RetailServices(
    apiKey: apiKey,
    appId: appId,
    organizationId: organizationId,
  );

  try {
    final retail = await retailServices.getRetail();

    print('Retail products: ${retail.products}');
  } catch (e) {
    print('Error: $e');
  }
}
