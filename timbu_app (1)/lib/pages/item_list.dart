import 'package:fimbu_mobile/model/product_model.dart';
import 'package:fimbu_mobile/pages/product_displaypage.dart';
import 'package:fimbu_mobile/services/fimbu_services.dart';
import 'package:fimbu_mobile/utils/keys.dart';
import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  late Future<Product> futureProduct;
  @override
  void initState() {
    super.initState();
    futureProduct = FimbuServices(
      api_key: api_key,
      app_id: app_id,
      organization_id: organizationId,
    ).getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Product>(
        future: futureProduct,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final items = snapshot.data!.items;
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final price = item.currentPrice.isNotEmpty &&
                          item.currentPrice[0].ngn.isNotEmpty
                      ? item.currentPrice[0].ngn[0].toString()
                      : 'No prices yet!';
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDescriptionPage(
                                item: item,
                              )));
                    },
                    child: ListTile(
                      leading: item.photos.isNotEmpty
                          ? Image.network(
                              'https://api.timbu.cloud/images/' +
                                  item.photos[0].url,
                              width: 70,
                              height: 60,
                              fit: BoxFit.cover,
                            )
                          : const Center(child: Text('No Image Available')),
                      title: Text(item.name ?? ""),
                      subtitle: Text(price),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Text('No data found, try again later!');
          }
        },
      ),
    );
  }
}
