import 'package:flutter/material.dart';
import '../services/mock_ai_service.dart';
import '../screens/result_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final palavra = 'MACACO';

  void _simularAnalise(BuildContext context) async {
    final insights = await MockAIService.analisarFala(palavra);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ResultScreen(insights: insights, palavra: palavra),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(title: const Text('FalaShow')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'MACACO',
            style: TextStyle(
              fontSize: 32,
              letterSpacing: 6,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 20),
          Image.asset('assets/macaco.png', height: 200),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.mic),
            label: const Text("Gravar e Analisar"),
            onPressed: () => _simularAnalise(context),
          ),
        ],
      ),
    );
  }
}
