import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// CartItem Class
class CartItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}

// CartModel Class
class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    final existingItemIndex =
        _items.indexWhere((element) => element.id == item.id);

    if (existingItemIndex >= 0) {
      _items[existingItemIndex].quantity += item.quantity;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + item.price * item.quantity);
  }

  int get itemCount {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }
}

// Main App
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CartScreen(),
    );
  }
}

// CartScreen
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Displaying cart items
            ...cart.items.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 125,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          item.imageUrl,
                          width: 80,
                          height: 125,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'RS34670',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black38,
                                  ),
                                ),
                                Spacer(), // Add Spacer here
                                Text(
                                  'unit price',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black38,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 90),
                                Text(
                                  '\$${(item.price * item.quantity).toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  height: 25,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (item.quantity > 1) {
                                          item.quantity--;
                                        } else {
                                          cart.removeItem(item);
                                        }
                                      });
                                    },
                                    icon: const Center(
                                      child: Icon(Icons.remove,
                                          size: 10, color: Color(0xff408C2B)),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${item.quantity}',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 25,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: IconButton(
                                    icon: const Center(
                                      child: Icon(Icons.add,
                                          size: 10, color: Color(0xff408C2B)),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        item.quantity++;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  width: 30,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffCC474E),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: IconButton(
                                    icon: const Center(
                                      child: Icon(Icons.delete,
                                          color: Colors.white, size: 10),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        cart.removeItem(item);
                                        // Adjust according to your actual item removal logic
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
            const SizedBox(height: 16),
            // Cart Summary
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
              child: Container(
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Cart summary',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Sub-total',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff6E6E6E),
                            height: 0.8,
                          ),
                        ),
                        Text(
                          '\$${cart.items.fold<double>(0, (sum, item) => sum + item.price * item.quantity).toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 0.8,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff6E6E6E),
                            height: 0.8,
                          ),
                        ),
                        Text(
                          '\$2.00',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            height: 0.8,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 8.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            side: const BorderSide(color: Colors.black),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Amount',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff797A7B),
                              ),
                            ),
                            Text(
                              '\$${(cart.items.fold<double>(0, (sum, item) => sum + item.price * item.quantity) + 2.00).toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff363939),
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff408C2B),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18.0,
                              vertical: 8.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          onPressed: () {
                            // Navigate to checkout screen or perform checkout logic
                          },
                          child: const Text(
                            'Checkout',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const TextWithUnderline(
                text: 'Deals',
                subtext: 'View all',
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://via.placeholder.com/150',
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Repair Scrub',
                            style: TextStyle(fontSize: 16),
                          ),
                          const Text(
                            '\$19.00',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Add to Cart'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Widget for Underlined Text
class TextWithUnderline extends StatelessWidget {
  final String text;
  final String subtext;

  const TextWithUnderline(
      {super.key, required this.text, required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
        Text(
          subtext,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
