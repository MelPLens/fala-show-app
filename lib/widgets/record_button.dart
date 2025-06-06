import 'package:flutter/material.dart';

class RecordButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RecordButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.mic),
      label: const Text("Gravar e Analisar"),
      onPressed: onPressed,
    );
  }
}
