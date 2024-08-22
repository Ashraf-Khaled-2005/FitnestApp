import 'package:flutter/material.dart';
import 'package:fitness_app/core/widget/logo.dart';

import 'OnboardingView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the animation (scaling from 0.0 to 1.0)
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    // Start the animation
    _controller.forward();
    Future.delayed(_controller.duration! + Duration(seconds: 1), () {
      _onAnimationEnd();
    });
  }

  void _onAnimationEnd() {
    // Navigate to another screen or perform any desired action
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => OnboardingView())); // Example navigation
  }

  @override
  void dispose() {
    // Dispose the animation controller to free up resources
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ScaleTransition(
              scale: _animation,
              child: const LogoRow(),
            );
          },
        ),
      ),
    );
  }
}
