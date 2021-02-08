import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:github_repo_search/models/results.dart';

//Parse http request json result into Results model

class ResultsRepo {
  Future<Results> getResults(String query) async {
    final url =
        'https://api.github.com/search/repositories?q=$query&sort=star&order=desc';
    final result = await http.get(url);
    if (result.statusCode != 200) {
      throw Exception();
    }
    final extractedData = json.decode(result.body) as Map<String, dynamic>;
    return Results.fromJson(extractedData);
  }
}
