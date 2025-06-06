import 'package:url_launcher/url_launcher.dart';

class WhatsAppService {
  static Future<void> enviarMensagem(String telefone, String mensagem) async {
    final url = Uri.parse(
      "https://wa.me/$telefone?text=${Uri.encodeComponent(mensagem)}",
    );

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception("Não foi possível abrir o WhatsApp.");
    }
  }
}
