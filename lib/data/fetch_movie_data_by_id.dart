import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../models/error_model.dart';
import '../models/book_model.dart';

class FetchMovieDataById {
  Future<List<dynamic>> getDetails(String id) async {
    BookInfoModel movieData;
    BookInfoModel omdbData;
    TrailerList trailersData;
    ImageBackdropList backdropsData;
    CastInfoList castData;
    BookModelList similarData;
    var images = [];
    var box = Hive.box('Books');
    var string = json.encode(box.get(id));
    var book = json.decode(string);

    movieData = BookInfoModel.fromJson(book['data']);
    trailersData = TrailerList.fromJson(book['videos']);
    images.addAll(book['images']['backdrops']);
    images.addAll(book['images']['posters']);
    images.addAll(book['images']['logos']);

    backdropsData = ImageBackdropList.fromJson(images);

    castData = CastInfoList.fromJson(book['credits']);
    // similarData = BookModelList.fromJson(book['similar']['results']);

    var imdbId = movieData.imdbid;

    return [
      movieData,
      trailersData.trailers,
      backdropsData.backdrops,
      castData.castList,
      [],
      // similarData.books,
      []
    ];
  }
}

List<BookModel> booksModel = [
  BookModel(
    title: "title",
    poster: "poster",
    id: "3",
    backdrop: "backdrop",
    voteAverage: 4,
    releaseDate: "releaseDate",
  ),
  BookModel(
    title: "title",
    poster: "poster",
    id: "3",
    backdrop: "backdrop",
    voteAverage: 4,
    releaseDate: "releaseDate",
  ),
  BookModel(
    title: "title",
    poster: "poster",
    id: "3",
    backdrop: "backdrop",
    voteAverage: 4,
    releaseDate: "releaseDate",
  ),
];
