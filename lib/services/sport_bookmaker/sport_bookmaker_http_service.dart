import 'dart:convert';
import 'package:fuksiarz/const/texts.dart';
import 'package:fuksiarz/services/sport_bookmaker/sports_bookmaker_service.dart';
import 'package:http/http.dart' as http;

class SportBookmakerService extends ISportBookmakerService {
  @override
  MatchesList getMatches() async {
    try {
      final jsonResponse = await httpGet(getSportBookmakerURL);
      final List<dynamic> data = jsonResponse['data'];

      return data.map((json) => SportBookmakerDTO.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}

Future<Map<String, dynamic>> httpGet(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
