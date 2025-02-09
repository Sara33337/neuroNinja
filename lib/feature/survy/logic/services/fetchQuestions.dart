import 'package:dio/dio.dart';
import 'package:neuro_ninja/feature/survy/presentation/view_model/survyModel.dart';

class SurveyService {
  final Dio dio;

  SurveyService({Dio? dio})
      : dio = dio ??
            Dio(BaseOptions(
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
              headers: {'Content-Type': 'application/json'},
            ));

  Future<List<SurvyQuestions>> fetchQuestions() async {
    try {
      final response = await dio.get('http://10.0.2.2:8000/questions');

      if (response.statusCode == 200 && response.data is List) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((question) {
          return SurvyQuestions(
            id: question["id"].toString(),
            question: question['text'] ?? "No question text available",
          );
        }).toList();
      } else {
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Error fetching questions: $e');
    }
  }

  Future<Map<String, dynamic>> submitSurveyResponses(Map<String, int> userAnswers) async {
    try {
      Response response = await dio.post(
        'http://10.0.2.2:8000/diagnose',
        data: {'responses': userAnswers},
      );

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        return response.data["diagnosis"] ?? {};  // Ensure diagnosis key exists
      } else {
        throw Exception("Unexpected response format.");
      }
    } on DioException catch (e) {
      throw Exception("Network error: ${e.message}");
    } catch (e) {
      throw Exception("Error submitting survey responses: $e");
    }
  }
}
