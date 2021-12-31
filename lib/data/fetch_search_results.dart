import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/error_model.dart';
import '../models/book_model.dart';
import '../models/people_model.dart';
import '../models/tv_model.dart';

class SearchResultsRepo {
  Future<List<dynamic>> getmovies(String query, int page) async {
    var res = await http.get(Uri.parse(
        'base_url' + '/search/movie?text=$query&page=${page.toString()}'));
    if (res.statusCode == 200) {
      return [
        (jsonDecode(res.body)['data'] as List)
            .map((list) => BookModel.fromJson(list))
            .toList(),
        jsonDecode(res.body)['total_pages'],
      ];
    } else {
      throw FetchDataError("Something went wrong!");
    }
  }

  Future<List<dynamic>> gettvShows(String query, int page) async {
    var res = await http.get(Uri.parse(
        'base_url' + '/search/tv?text=$query&page=${page.toString()}'));
    if (res.statusCode == 200) {
      return [
        (jsonDecode(res.body)['data'] as List)
            .map((list) => TvModel.fromJson(list))
            .toList(),
        jsonDecode(res.body)['total_pages'],
      ];
    } else {
      throw FetchDataError("Something went wrong!");
    }
  }

  Future<List<dynamic>> getPersons(String query, int page) async {
    var res = await http.get(Uri.parse(
        'base_url' + '/search/person?text=$query&page=${page.toString()}'));
    if (res.statusCode == 200) {
      return [
        (jsonDecode(res.body)['data'] as List)
            .map((list) => PeopleModel.fromJson(list))
            .toList(),
        jsonDecode(res.body)['total_pages'],
      ];
    } else {
      throw FetchDataError("Something went wrong!");
    }
  }
}
