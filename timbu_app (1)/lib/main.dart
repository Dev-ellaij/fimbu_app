import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fimbu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FimbuHomePage(),
    );
  }
}

class FimbuHomePage extends StatefulWidget {
  @override
  _FimbuHomePageState createState() => _FimbuHomePageState();
}

class _FimbuHomePageState extends State<FimbuHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Fimbu'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Shoes Bag'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ItemList(),
          ItemList(),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Item 1',
      'description': 'Description 1',
      'price': '\$10',
    },
    {
      'image': 'https://via.placeholder.com/150',
      'name': 'Item 2',
      'description': 'Description 2',
      'price': '\$20',
    },
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Card(
            color: Colors.white,
            child: ListTile(
              leading: Image.network(item['image']!),
              title: Text(item['name']!),
              subtitle: Text(item['description']!),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item['price']!,
                    style: TextStyle(color: Colors.purple),
                  ),
                  SizedBox(height: 4),
                  Icon(Icons.favorite, color: Colors.purple),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
