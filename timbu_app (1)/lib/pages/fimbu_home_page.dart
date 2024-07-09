import 'package:fimbu_mobile/pages/item_list.dart';
import 'package:flutter/material.dart';

class FimbuHomePage extends StatefulWidget {
  FimbuHomePage({super.key});
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
        title: const Text('Fimbu'),
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
