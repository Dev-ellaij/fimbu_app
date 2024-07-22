// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'lastcartpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
      routes: {
        '/last_cart': (context) => const Column(
              children: [
                CartScreen(),
              ],
            ),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/last_cart');
            },
          ),
        ],
      ),
      body: const HomePageContent(),
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 932,
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          const SizedBox(height: 101),
          Container(
            width: 64,
            height: 64,
            child: const Center(
              child: Text(
                '-',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF408C2B),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 96),
          AnimatedBuilder(
            animation: _animation,
            child: const Icon(
              Icons.shopping_cart,
              color: Color(0xFF408C2B),
              size: 48,
            ),
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value,
                child: child,
              );
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'Your Cart is empty',
            style: TextStyle(
              color: Color(0xFF0A0B0A),
              fontSize: 18,
              fontFamily: 'Lora',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 38),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 48.0),
            child: Text(
              'Explore our collections today and start your journey towards radiant beauty. Your skin will thank you',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF818181),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 68),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/last_cart');
            },
            child: Container(
              width: 160,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: ShapeDecoration(
                color: const Color(0xFF408C2B),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: const Center(
                child: Text(
                  'Start shopping',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 80),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recently viewed',
                      style: TextStyle(
                        color: Color(0xFF0A0B0A),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w300,
                        letterSpacing: 4.34,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/last_cart');
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          color: Color(0xFF408C2B),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0xFFCCCBCB),
                indent: 48,
                endIndent: 48,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 47.0),
                child: Column(
                  children: [
                    // ignore: prefer_const_constructors
                    RecentlyViewedItem(),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Repair Scrub',
                              style: TextStyle(
                                color: Color(0xFF797A7B),
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '\$19.00',
                              style: TextStyle(
                                color: Color(0xFF363939),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/last_cart');
                          },
                          child: Container(
                            width: 56,
                            height: 24,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 0.79, color: Color(0xFF408C2B)),
                                borderRadius: BorderRadius.circular(2.37),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Add to Cart',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF408C2B),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RecentlyViewedItem extends StatelessWidget {
  const RecentlyViewedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/last_cart');
      },
      child: Container(
        width: 160,
        height: 160,
        decoration: ShapeDecoration(
          color: const Color(0xFFFBFDFD),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.46, color: Color(0xFFCCCBCB)),
            borderRadius: BorderRadius.circular(5.65),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '1',
                style: TextStyle(
                  color: Color(0xFF0A0B0A),
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 93.06,
                height: 68.61,
                child: Stack(
                  children: [
                    Positioned(
                      left: -13,
                      top: 0,
                      child: Opacity(
                        opacity: 0.70,
                        child: Container(
                          width: 130,
                          height: 109,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/130x109"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -12.81,
                      top: -0.51,
                      child: Container(
                        width: 99.87,
                        height: 73.45,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/100x73"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: -14.27,
                      top: 18.88,
                      child: Container(
                        width: 101.57,
                        height: 50.42,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/102x50"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
