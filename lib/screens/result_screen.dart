import 'package:flutter/material.dart';
import '../services/whatsapp_service.dart';

class ResultScreen extends StatelessWidget {
  final List<String> insights;
  final String palavra;

  const ResultScreen({
    super.key,
    required this.insights,
    required this.palavra,
  });

  @override
  Widget build(BuildContext context) {
    final mensagem =
        '''
🧠 *Análise de Fala*
📌 Palavra: $palavra

📌 *Recomendações para Prática*:
${insights.map((e) => "- $e").join("\n")}
''';

    return Scaffold(
      appBar: AppBar(title: const Text("Análise da Fala")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Recomendações da IA",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ...insights.map(
              (e) => ListTile(leading: const Icon(Icons.check), title: Text(e)),
            ),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("Enviar para a fono"),
              onPressed: () =>
                  WhatsAppService.enviarMensagem('55NUMERODAFONO', mensagem),
            ),
          ],
        ),
      ),
    );
  }
}
