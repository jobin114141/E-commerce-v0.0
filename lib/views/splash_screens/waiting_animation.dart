import 'package:flutter/material.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _indexAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Total cycle duration
    )..repeat();

    _indexAnimation = IntTween(begin: 0, end: 3).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _controller.addListener(() {
      setState(() {}); // Redraw the widget when animation updates
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
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            bool isActive = _indexAnimation.value == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isActive ? 25 : 15, // Larger when active
              height: isActive ? 25 : 15,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? Colors.white : const Color.fromARGB(255, 255, 255, 255), // Highlight active ball
              ),
            );
          }),
        ),
      ),
    );
  }
}
