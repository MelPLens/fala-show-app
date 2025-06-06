class MockAIService {
  static Future<List<String>> analisarFala(String palavra) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return [
      "Praticar fonema /r/ em início de palavras",
      "Aumentar duração das vogais",
      "Exercícios de respiração recomendados",
      "Foco em palavras com /s/ final",
    ];
  }
}
