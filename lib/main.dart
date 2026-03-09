import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Montserrat',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showControl = false;
  bool _showYour = false;
  bool _showBike = false;

  @override
  void initState() {
    super.initState();
    // Start the animation sequence
    Timer(const Duration(milliseconds: 1500), () {
      if (mounted) setState(() => _showControl = true);
      Timer(const Duration(milliseconds: 300), () {
        if (mounted) setState(() => _showYour = true);
        Timer(const Duration(milliseconds: 300), () {
          if (mounted) setState(() => _showBike = true);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Gradient bar
            Positioned(
              top: 16.0,
              left: screenWidth * 0.375,
              right: screenWidth * 0.375,
              child: Container(
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xFFD5FF40).withAlpha(204), Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            // Motorcycle Image
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: screenHeight * 0.55,
                child: Image.asset(
                  'assets/images/motor.png',
                  fit: BoxFit.contain,
                  opacity: const AlwaysStoppedAnimation(0.4),
                  color: Colors.black.withValues(alpha: 0.3),
                  colorBlendMode: BlendMode.darken,
                ),
              ),
            ),

            // Main content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.notifications,
                      color: Color(0xFFD5FF40),
                      size: 30,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Greeting Text
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Hello Mefby!',
                          textStyle: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1, // Only run once
                      isRepeatingAnimation: false,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Main Title Text
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedTextSlide(show: _showControl, text: 'Control', style: const TextStyle(color: Colors.white)),
                        AnimatedTextSlide(show: _showYour, text: 'Your', style: const TextStyle(color: Colors.white)),
                        AnimatedTextSlide(show: _showBike, text: 'Bike', style: const TextStyle(color: Color(0xFFD5FF40))),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Bottom lock button and text
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFD5FF40),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFFD5FF40).withAlpha(127),
                                blurRadius: 15,
                                spreadRadius: 5,
                              )
                            ],
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.lock_open, color: Colors.black, size: 40),
                            iconSize: 60,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Hold to unlock bike',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white.withAlpha(179),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Widget for the slide-in animation
class AnimatedTextSlide extends StatelessWidget {
  const AnimatedTextSlide({
    super.key,
    required this.show,
    required this.text,
    required this.style,
  });

  final bool show;
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: show ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, show ? 0 : 30, 0),
        child: Text(
          text,
          style: style.copyWith(
            fontFamily: 'Montserrat',
            fontSize: 62,
            fontWeight: FontWeight.w400,
            height: 1.0,
          ),
        ),
      ),
    );
  }
}
