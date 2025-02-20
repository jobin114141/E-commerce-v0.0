import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _circleController;
  late Animation<double> _circleAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Circle expansion animation
    _circleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _circleAnimation = Tween<double>(begin: 0, end: 2000).animate(
      CurvedAnimation(
        parent: _circleController,
        curve: Curves.easeInOut,
      ),
    );

    // Fade-in animation for text
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Smooth fade-in
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );

    // Start the circle animation
    _circleController.forward();

    // Start fade animation when the circle animation completes
    _circleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeController.forward();
      }
    });
  }

  @override
  void dispose() {
    _circleController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Expanding Circle
          AnimatedBuilder(
            animation: _circleAnimation,
            builder: (context, child) {
              return Positioned(
                left: -_circleAnimation.value / 2,
                top: MediaQuery.of(context).size.height / 2 - _circleAnimation.value / 2,
                child: Container(
                  width: _circleAnimation.value,
                  height: _circleAnimation.value,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),

          // Fading Text (Appears after circle animation completes)
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                  "UNISHOP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    shadows: [
                     
                    ],
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
