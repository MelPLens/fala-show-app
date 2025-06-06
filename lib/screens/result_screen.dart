import 'package:flutter/material.dart';
import '../services/whatsapp_service.dart';

class ResultScreen extends StatelessWidget {
  final List<String> insights;
  final String palavra;

  const ResultScreen(
      {super.key, required this.insights, required this.palavra});

  @override
  Widget build(BuildContext context) {
    final TextEditingController telefoneController = TextEditingController();

    final mensagem = '''
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
            Text("Recomendações da IA",
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            ...insights.map(
              (e) => ListTile(leading: const Icon(Icons.check), title: Text(e)),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: telefoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Número da Fono (com DDI, ex: 55...)",
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("Enviar para a fono"),
              onPressed: () {
                final numero = telefoneController.text.trim();
                if (numero.isNotEmpty) {
                  WhatsAppService.enviarMensagem(numero, mensagem);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
