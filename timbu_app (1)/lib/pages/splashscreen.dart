import 'package:fimbu_mobile/main.dart';
import 'package:fimbu_mobile/pages/fimbu_home_page.dart';
import 'package:flutter/material.dart';

class FimbuText extends StatefulWidget {
  const FimbuText({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FimbuTextState createState() => _FimbuTextState();
}

class _FimbuTextState extends State<FimbuText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Navigate to the next screen after the animation duration
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FimbuHomePage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple,
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: const Text(
                  'Fimbu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
