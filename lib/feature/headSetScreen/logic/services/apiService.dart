import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  // Method to upload the file to the server
  Future<void> uploadFile(File file) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://10.0.2.2:8000/predict/'),
      );

      request.files.add(
        await http.MultipartFile.fromPath('file', file.path),
      );

      request.headers['accept'] = 'application/json';

      var response = await request.send().timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        print('File uploaded successfully. Response: $responseData');
        
        // After file upload, send a GET request with the file name
        var fileName = file.uri.pathSegments.last; // Extract the file name from the path
        await getPrediction(fileName);
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred during file upload: $e');
    }
  }

  // Method to make the GET request based on the file name
   Future<int> getPrediction(String fileName) async {
  try {
    var response = await http.get(
      Uri.parse('http://10.0.2.2:8000/predict/?file_name=$fileName'),
      headers: {'accept': 'application/json'},
    ).timeout(Duration(seconds: 30));

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      return responseData['prediction']; // Return the confidence value
    } else {
      print('Failed to fetch prediction. Status code: ${response.statusCode}');
      return 0; // Return 0.0 if failed to get confidence
    }
  } catch (e) {
    print('Error occurred during GET request: $e');
    return 0; // Return 0.0 in case of error
  }
}

}
