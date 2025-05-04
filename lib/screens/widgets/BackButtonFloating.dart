import 'package:flutter/material.dart';
import 'package:resepin/core/constants/app_colors.dart';

class BackButtonFloating extends StatelessWidget {
  final String text;

  const BackButtonFloating({
    super.key,
    this.text = 'Kembali ke Start',
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 40, bottom: 20),
        child: SizedBox(
          width: 180,
          height: 45,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/start',
                (Route<dynamic> route) => false,
              );
            },
            backgroundColor: AppColors.primary,
            label: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
