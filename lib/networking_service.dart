import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:urban_dictionary/define_term_response.dart';
import 'package:urban_dictionary/term.dart';

class NetworkingService {
  Future<List<Term>> defineTerm(String searchTerm) async {
    final Map<String, String> queryParameters = {'term': searchTerm};

    final Uri uri = Uri.https(
        'mashape-community-urban-dictionary.p.rapidapi.com',
        'define',
        queryParameters);

    final headers = {"x-rapidapi-key": "", "x-rapidapi-host": ""};

    var response = await http.get(uri, headers: headers);
    var list = [for (var i = 200; i < 300; i += 1) i];

    if (list.contains(response.statusCode)) {
      final defineTermResponse =
          DefineTermResponse.fromJson(jsonDecode(response.body));
      return defineTermResponse.list;
    } else {
      throw Exception('Failed to define term');
    }
  }
}
