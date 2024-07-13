import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Details',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProductDetails(),
    );
  }
}

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                color: const Color(0xFFE4F5E0),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const ImageIcon(AssetImage('assets/images/arrow-left.png')),
                          ),
                          const SizedBox(width: 16), // add a spacer with a width of 16
                          const ImageIcon(AssetImage('assets/images/icons8-shopping-cart-48.png')),
                        ],
                      ),
                      StackedImageCard(
                        backgroundImagePath: 'assets/images/image 30.png',
                        foregroundImagePath: 'assets/images/Cream Jar Mockup.png',
                      ),
                    ],
                  ),
                ),
              ),
              const RowWithTwoImages(
                imagePath1: 'assets/images/Repair scrub container.png',
                imagePath2: 'assets/images/Carousel card.png',
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: RowWithTwoTexts(
                  text1: 'RS34670',
                  text2: 'In Stock',
                ),
              ),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Repair Scrub',
                        style: TextStyle(
                          fontSize: 24,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Our Repair Body Scrub is expertly crafted to rejuvenate and revitalize your skin. This luxurious scrub combines natural exfoliants with nourishing ingredients to gently remove dead skin cells, promote cell renewal, and restore your skin\'s natural radiance.',
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
horizontal: 20.0),
horizontal: 20.0),
                child: Row(
                  children: [
                    const Text(
                      'How to use ',
                      style: TextStyle(
                        color: Color(0xFF343434),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Spacer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    const Text(
                      'Delivery and drop-off',
                      style: TextStyle(
                        color: Color(0xFF343434),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Spacer
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 48),
                decoration: const BoxDecoration(color: Color(0xFF408C2B)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sub',
                          style: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$19.00',
                          style: TextStyle(
                            color: Color(0xFFFAFAFA),
                            fontSize: 18,
                            fontFamily: 'Lora',
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                    Opacity(
                      opacity: 0.90,
                      child: Container(
                        width: 152,
                        height: 40,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 2, color: Color(0xFFFAFAFA)),
                            borderRadius: BorderRadius.circular(3.82),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Cart',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFAFAFA),
                              fontSize: 18,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
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
