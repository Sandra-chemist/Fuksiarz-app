import 'dart:convert';
import 'package:fuksiarz/const/texts.dart';
import 'package:http/http.dart' as http;

class SearchService {
  Future<List<String>> fetchSearchResults(String query) async {
    try {
      final response = await http.post(
        Uri.parse(searchUrl),
        headers: {
          'Content-Type': 'application/json',
          'Request-Language': 'pl',
        },
        body: jsonEncode({
          "areas": ["CATEGORY", "PREMATCH_EVENT"],
          "languageCode": "pl",
          "limit": 10,
          "mergeLanguages": 1,
          "modes": ["INFIX", "PREFIX"],
          "pattern": query,
        }),
      );

      if (response.statusCode == 200) {
        try {
          final data = jsonDecode(response.body);
          return List<String>.from(
            (data['data'] as List).map((item) => item['name']),
          );
        } catch (e) {
          throw Exception('Error decoding the JSON response: $e');
        }
      } else {
        throw Exception('Failed to fetch data: HTTP status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
