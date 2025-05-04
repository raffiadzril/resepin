import 'package:flutter/material.dart';
import 'loginScreen.dart';


class LoadingScreen3 extends StatelessWidget {
  const LoadingScreen3({super.key});
  
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
                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Zr9XNziQY7/y2fofq6o_expires_30_days.png"
                ),
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
                    "Siapkan rencana mingguan untuk\nmenu-menu kamu di resepin\ndengan fitur rencana menu!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Ayo Masak",
                      style: TextStyle(
                        color: Color(0xFFE6303B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Page Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildIndicator(),
                      const SizedBox(width: 6),
                      _buildIndicator(),
                      const SizedBox(width: 6),
                      _buildIndicator(isActive: true),
                    ],
                  ),
                  const SizedBox(height: 6),
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
