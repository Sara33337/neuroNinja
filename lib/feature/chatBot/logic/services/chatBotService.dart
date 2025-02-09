import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotService {
  static const String baseUrl = "http://10.0.2.2:8000";

  static Future<List<String>> fetchCommonQuestions() async {
    

    final response = await http.get(
      Uri.parse("$baseUrl/common_questions"),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<String>.from(data["common_questions"]);
    } else {
      throw Exception("Failed to load common questions");
    }
  }

  static Future<String> askQuestion(String question) async {
    final url = Uri.parse("$baseUrl/ask");
    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({"question": question}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data["answer"] ?? "No response from chatbot.";
      } else {
        return "Failed to get response. Error code: ${response.statusCode}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}