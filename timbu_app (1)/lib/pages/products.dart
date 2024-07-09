import 'package:fimbu_mobile/model/item_model.dart';
import 'package:fimbu_mobile/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDescriptionPage extends StatelessWidget {
  final Item item;

  ProductDescriptionPage({required this.item});

  @override
  Widget build(BuildContext context) {
    final price =
        item.currentPrice.isNotEmpty && item.currentPrice[0].ngn.isNotEmpty
            ? item.currentPrice[0].ngn[0].toString()
            : 'No prices yet!';
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://api.timbu.cloud/images/' + item.photos[0].url,
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Text(
              item.name ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              item.description ?? " ",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
