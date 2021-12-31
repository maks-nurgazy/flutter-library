import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieinfo/hive_models/books.dart';

import '../models/book_model.dart';
import '../models/tv_model.dart';

class FetchHomeRepo {
  Future<Map<String, dynamic>> getHomePageMovies() async {
    BookModelList trandingData;
    BookModelList nowPlayeingData;
    BookModelList topRatedData;
    BookModelList upcomingData;
    TvModelList tvshowData;
    TvModelList topRatedTvData;

    final books = Books.getBooks();

    if (books.length != 0) {
      trandingData = BookModelList.fromBox(books);
      nowPlayeingData = BookModelList.fromBox(books);
      topRatedData = BookModelList.fromBox(books);
      upcomingData = BookModelList.fromBox(books);
      tvshowData = TvModelList(books: []);
      topRatedTvData = TvModelList(books: []);
      return {
        "tranding": trandingData.books,
        "nowPlayeing": nowPlayeingData.books,
        "topRated": topRatedData.books,
        "upcoming": upcomingData.books,
        "tvShow": tvshowData.books,
        "topRatedTv": topRatedTvData.books
      };
    } else {
      throw Exception('Failed to load data');
    }
  }
}
