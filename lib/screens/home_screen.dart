import 'package:flutter/material.dart';
import '../services/mock_ai_service.dart';
import '../screens/result_screen.dart';
import '../widgets/record_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final palavra = 'MACACO';
  String? caminhoAudio;

  void _analisarFala() async {
    if (caminhoAudio == null) return;

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
          Text(
            palavra,
            style: const TextStyle(
                fontSize: 32, letterSpacing: 6, color: Colors.purple),
          ),
          const SizedBox(height: 20),
          Image.asset('assets/macaco.png', height: 200),
          const SizedBox(height: 20),
          RecordButton(
            onFinished: (path) {
              setState(() {
                caminhoAudio = path;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: caminhoAudio != null ? _analisarFala : null,
            child: const Text("Analisar Fala"),
          )
        ],
      ),
    );
  }
}
