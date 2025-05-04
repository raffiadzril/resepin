import 'package:flutter/material.dart';

class BannerTittle extends StatelessWidget {
  final String text;
  final String imageAsset;
  final Color gradientColor1;

  const BannerTittle({
    super.key,
    required this.text,
    required this.imageAsset,
    required this.gradientColor1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage(imageAsset),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              gradientColor1.withOpacity(0.8),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 8,
                color: Colors.black45,
                offset: Offset(1, 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
