import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Gradient bar (height reduced)
            Positioned(
              top: 16.0, // Aligned with the top of the notification icon's padding
              left: screenWidth * 0.375,
              right: screenWidth * 0.375,
              child: Container(
                height: screenHeight * 0.3, // Reduced height
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
                  opacity: const AlwaysStoppedAnimation(0.7),
                ),
              ),
            ),

            // Main content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row: Notification Icon Only
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.notifications,
                      color: Color(0xFFD5FF40),
                      size: 30,
                    ),
                  ),

                  const SizedBox(height: 15), // Move text block further up

                  // Greeting Text (aligned with title)
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Hello Mefby!',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8), // Space between greeting and title

                  // Main Title Text (Slightly smaller)
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                          fontSize: 62,
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                        ),
                        children: const [
                          TextSpan(
                            text: 'Control\n',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'Your\n',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: 'Bike',
                            style: TextStyle(color: Color(0xFFD5FF40)),
                          ),
                        ],
                      ),
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
                          style: GoogleFonts.montserrat(
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
