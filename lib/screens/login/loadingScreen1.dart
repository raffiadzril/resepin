import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'loadingScreen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoadingScreen1(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoadingScreen1 extends StatelessWidget {
  const LoadingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Zr9XNziQY7/y2fofq6o_expires_30_days.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Red Card
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              decoration: BoxDecoration(
                color: const Color(0xFFE6303B),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Masak Seru\nMulai dari",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.network(
                    "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Zr9XNziQY7/eu4crbzd_expires_30_days.png",
                    width: 160,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    "Resep-resep lezat lagi antre buat\njadi jagoan masakan kamu hari ini.\nSiap masak bareng Resepin?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildIndicator(isActive: true),
                      const SizedBox(width: 6),
                      _buildIndicator(),
                      const SizedBox(width: 6),
                      _buildIndicator(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoadingScreen2()),
                          );
                        },
                        child: Row(
                          children: [
                            const Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Image.network(
                              "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Zr9XNziQY7/835cvsqt_expires_30_days.png",
                              width: 11,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator({bool isActive = false}) {
    return Container(
      width: 25,
      height: 6,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
