import 'package:flutter/material.dart';
import 'package:resepin/core/constants/app_colors.dart';

class BackButtonFloating extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const BackButtonFloating({
    super.key,
    this.text = 'Kembali ke Start',
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft, // Letakkan di kiri bawah
      child: Container(
        margin: const EdgeInsets.only(left: 40),
        child: SizedBox(
          width: 120,
          height:40,
          child: FloatingActionButton.extended(
            onPressed: onPressed ?? () {
              // Navigasi ke StartScreen
              Navigator.pushReplacementNamed(context, '/start');
            },
            backgroundColor: AppColors.primary,
            label: Text(
              text,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
