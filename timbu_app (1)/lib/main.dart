import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int cartItemCount = 0;
  List<String> items = [
    'Repair Scrub',
    'Hydrate Cream',
    'Sunscreen',
    'Serum',
    'Cleanser'
  ];
  List<String> filteredItems = [];
  int _currentIndex = 0;
  List<String> wishlist = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void addToCart() {
    setState(() {
      cartItemCount++;
    });
  }

  void addToWishlist(String item) {
    setState(() {
      if (!wishlist.contains(item)) {
        wishlist.add(item);
      }
    });
  }

  void filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const OrderHistoryScreen()));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WishlistScreen(wishlist: wishlist)));
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WishlistScreen()));
        break;
      case 4:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const MyHomePage())); // Navigate to CartScreen with tabs
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sharrie’s Signature',
          style: TextStyle(
            color: Color(0xFF408C2B),
            fontSize: 24,
            fontFamily: 'Redressed',
            fontWeight: FontWeight.w400,
            height: 1.05,
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MyHomePage())); // Navigate to CartScreen with tabs
                },
              ),
              if (cartItemCount > 0)
                Positioned(
                  right: 4,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '$cartItemCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Search',
                style: TextStyle(
                  color: Color(0xFF363939),
                  fontSize: 18,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w600,
                  height: 1.07,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: filterItems,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Our Products',
                style: TextStyle(
                  color: Color(0xFF363939),
                  fontSize: 18,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w600,
                  height: 1.07,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 270, // Ensure this height is appropriate
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    enableInfiniteScroll: true,
                  ),
                  items: filteredItems.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ProductBox(
                            item: item,
                            onTap: addToCart,
                            addToWishlist: addToWishlist,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Deals',
                style: TextStyle(
                  color: Color(0xFF363939),
                  fontSize: 18,
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.w600,
                  height: 1.07,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductDetails()),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: const Center(
                              child: AnimatedHeartIcon(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            '50% OFF',
                            style: TextStyle(
                              color: Color(0xFF797A7B),
                              fontSize: 10,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0.15,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Get the latest deals on our products!',
                            style: TextStyle(
                              color: Color(0xFF363939),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0.11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green, // Green background color
        selectedItemColor: Colors.white, // White color for selected items
        unselectedItemColor:
            Colors.white.withOpacity(0.6), // Lighter green for unselected items
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: onTabTapped,
      ),
    );
  }
}

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: const Center(
        child: Text('Order History Screen'),
      ),
    );
  }
}

class WishlistScreen extends StatelessWidget {
  final List<String> wishlist;

  const WishlistScreen({super.key, required this.wishlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(wishlist[index]),
          );
        },
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: const Center(
        child: Text('Product Details Screen'),
      ),
    );
  }
}

class AnimatedHeartIcon extends StatelessWidget {
  const AnimatedHeartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.favorite_border,
      color: Colors.red,
    );
  }
}

class ProductBox extends StatelessWidget {
  final String item;
  final VoidCallback onTap;
  final Function(String) addToWishlist;

  const ProductBox({
    super.key,
    required this.item,
    required this.onTap,
    required this.addToWishlist,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 180, // Adjust width as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductDetails()),
                ),
                child: Container(
                  height: 220, // Ensure this height fits well
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: GestureDetector(
                  onTap: () {
                    addToWishlist(item);
                  },
                  child: const AnimatedHeartIcon(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item,
            style: const TextStyle(
              color: Color(0xFF797A7B),
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0.15,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$19.00',
                style: TextStyle(
                  color: Color(0xFF363939),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.11,
                ),
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 80,
                  height: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 6.31),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.79, color: Color(0xFF408C2B)),
                      borderRadius: BorderRadius.circular(2.37),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Add to Cart',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF408C2B),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.08,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
