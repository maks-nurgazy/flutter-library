import 'package:hive/hive.dart';

import 'formated_time_genrator.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String poster;

  @HiveField(2)
  final String id;

  @HiveField(3)
  final String backdrop;

  @HiveField(4)
  final double voteAverage;

  @HiveField(5)
  final String releaseDate;
  BookModel({
    required this.title,
    required this.poster,
    required this.id,
    required this.backdrop,
    required this.voteAverage,
    required this.releaseDate,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    var string = "Not Available";
    getString() {
      try {
        string =
            "${monthgenrater(json['release_date'].split("-")[1])} ${json['release_date'].split("-")[2]}, ${json['release_date'].split("-")[0]}";
        // ignore: empty_catches
      } catch (e) {}
    }

    getString();
    return BookModel(
      backdrop: json['backdrop_path'] != null
          ? "https://image.tmdb.org/t/p/w500" + json['backdrop_path']
          : "https://images.pexels.com/photos/4089658/pexels-photo-4089658.jpeg?cs=srgb&dl=pexels-victoria-borodinova-4089658.jpg&fm=jpg",
      poster: json['poster_path'] != null
          ? "https://image.tmdb.org/t/p/w500" + json['poster_path']
          : "https://images.pexels.com/photos/4089658/pexels-photo-4089658.jpeg?cs=srgb&dl=pexels-victoria-borodinova-4089658.jpg&fm=jpg",
      id: json['id'].toString(),
      title: json['title'] ?? '',
      voteAverage: json['vote_average'].toDouble() ?? 0.0,
      releaseDate: string,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "poster": poster,
      "id": id,
      "backdrop": backdrop,
      "voteAverage": voteAverage,
      "releaseDate": releaseDate,
    };
  }
}

class BookModelList {
  final List<BookModel> books;
  BookModelList({
    required this.books,
  });

  factory BookModelList.fromBox(Box<dynamic> box) {
    List<BookModel> books = [];

    for (int i = 0; i < box.length; i++) {
      books.add(box.getAt(i));
    }
    return BookModelList(books: books);
  }
}

class BookInfoModel {
  final String tmdbId;
  final String overview;
  final String title;
  final List languages;
  final String backdrops;
  final String poster;
  final int budget;
  final String tagline;
  final double rateing;
  final String dateByMonth;
  final int runtime;
  final String homepage;
  final String imdbid;
  final List genres;
  final String releaseDate;
  BookInfoModel({
    required this.tmdbId,
    required this.overview,
    required this.title,
    required this.languages,
    required this.backdrops,
    required this.poster,
    required this.budget,
    required this.tagline,
    required this.rateing,
    required this.dateByMonth,
    required this.runtime,
    required this.homepage,
    required this.imdbid,
    required this.genres,
    required this.releaseDate,
  });
  factory BookInfoModel.fromJson(json) {
    var string = "";
    getString() {
      try {
        string =
            "${monthgenrater(json['release_date'].split("-")[1])} ${json['release_date'].split("-")[2]}, ${json['release_date'].split("-")[0]}";
        // ignore: empty_catches
      } catch (e) {}
    }

    getString();
    return BookInfoModel(
      budget: json['budget'],
      title: json['title'] ?? '',
      homepage: json['homepage'] ?? "",
      imdbid: json['imdb_id'] ?? "",
      languages: (json['spoken_languages'] as List)
          .map((laung) => laung['english_name'])
          .toList(),
      genres: (json['genres'] as List).map((laung) => laung['name']).toList(),
      overview: json['overview'] ?? json['actors'] ?? '',
      backdrops: json['backdrop_path'] != null
          ? "https://image.tmdb.org/t/p/original" + json['backdrop_path']
          : "https://images.pexels.com/photos/4089658/pexels-photo-4089658.jpeg?cs=srgb&dl=pexels-victoria-borodinova-4089658.jpg&fm=jpg",
      poster: json['poster_path'] != null
          ? "https://image.tmdb.org/t/p/w500" + json['poster_path']
          : "https://images.pexels.com/photos/4089658/pexels-photo-4089658.jpeg?cs=srgb&dl=pexels-victoria-borodinova-4089658.jpg&fm=jpg",
      rateing: json['vote_average'].toDouble() ?? 0.0,
      runtime: json['runtime'],
      tagline: json['tagline'] ?? json['actors'] ?? '',
      tmdbId: json['id'].toString(),
      releaseDate: json['release_date'] ?? '',
      dateByMonth: string,
    );
  }
}

class BookInfoImdb {
  final String genre;
  final String runtime;
  final String director;
  final String writer;
  final String actors;
  final String language;
  final String awards;
  final String released;
  final String country;
  final String boxOffice;
  final String year;
  final String rated;
  final String plot;
  final String production;
  BookInfoImdb({
    required this.genre,
    required this.runtime,
    required this.director,
    required this.writer,
    required this.actors,
    required this.language,
    required this.awards,
    required this.released,
    required this.country,
    required this.boxOffice,
    required this.year,
    required this.rated,
    required this.plot,
    required this.production,
  });
  factory BookInfoImdb.fromJson(json) {
    return BookInfoImdb(
      actors: json['Actors'] ?? '',
      rated: json['Rated'] ?? '',
      production: json['Production'] ?? '',
      plot: json['Plot'] ?? '',
      awards: json['Awards'] ?? '',
      director: json['Director'] ?? '',
      genre: json['Genre'] ?? '',
      language: json['Language'] ?? '',
      released: json['Released'] ?? '',
      runtime: json['Runtime'] ?? '',
      writer: json['Writer'] ?? '',
      year: json['Year'].toString(),
      boxOffice: json['BoxOffice'].toString(),
      country: json['Country'] ?? '',
    );
  }
}

class TrailerModel {
  final String id;
  final String site;
  final String name;
  final String key;
  TrailerModel({
    required this.id,
    required this.site,
    required this.name,
    required this.key,
  });
  factory TrailerModel.fromJson(json) {
    return TrailerModel(
      key: json['key'] ?? '',
      id: json['id'] ?? '',
      site: json['site'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class TrailerList {
  final List<TrailerModel> trailers;
  TrailerList({
    required this.trailers,
  });
  factory TrailerList.fromJson(json) {
    return TrailerList(
        trailers: (json['results'] as List)
            .map((trailer) => TrailerModel.fromJson(trailer))
            .toList());
  }
}

class ImageBackdrop {
  final String image;
  ImageBackdrop({
    required this.image,
  });
  factory ImageBackdrop.fromJson(json) {
    return ImageBackdrop(
      image: "https://image.tmdb.org/t/p/original" + json['file_path'],
    );
  }
}

class ImageBackdropList {
  final List<ImageBackdrop> backdrops;

  ImageBackdropList({
    required this.backdrops,
  });

  factory ImageBackdropList.fromJson(backdrops) {
    return ImageBackdropList(
      backdrops: (backdrops as List)
          .map((backdrop) => ImageBackdrop.fromJson(backdrop))
          .toList(),
    );
  }
}

class CastInfo {
  final String name;
  final String character;
  final String image;
  final String id;
  CastInfo({
    required this.name,
    required this.character,
    required this.image,
    required this.id,
  });
  factory CastInfo.fromJson(json) {
    return CastInfo(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      character: json['character'] ?? '',
      image: json['profile_path'] != null
          ? "https://image.tmdb.org/t/p/w500" + json['profile_path']
          : "",
    );
  }
}

class CastInfoList {
  final List<CastInfo> castList;
  CastInfoList({
    required this.castList,
  });
  factory CastInfoList.fromJson(json) {
    return CastInfoList(
      castList: ((json['cast'] ?? []) as List)
          .map((cast) => CastInfo.fromJson(cast))
          .toList(),
    );
  }
}
