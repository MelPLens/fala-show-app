import 'package:flutter/material.dart';

class ImageWordCard extends StatelessWidget {
  final String palavra;
  final String imagemPath;

  const ImageWordCard({
    super.key,
    required this.palavra,
    required this.imagemPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          palavra,
          style: const TextStyle(
            fontSize: 32,
            letterSpacing: 6,
            color: Colors.purple,
          ),
        ),
        const SizedBox(height: 20),
        Image.asset(imagemPath, height: 200),
      ],
    );
  }
}
