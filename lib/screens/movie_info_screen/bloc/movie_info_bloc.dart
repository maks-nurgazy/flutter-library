import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/fetch_movie_data_by_id.dart';
import '../../../models/error_model.dart';
import '../../../models/book_model.dart';

part 'movie_info_event.dart';
part 'movie_info_state.dart';

class MovieInfoBloc extends Bloc<MovieInfoEvent, MovieInfoState> {
  final repo = FetchMovieDataById();

  MovieInfoBloc() : super(MovieInfoInitial()) {
    on<MovieInfoEvent>((event, emit) async {
      if (event is LoadMoviesInfo) {
        try {
          emit(MovieInfoLoading());
          // final List<dynamic> info = await repo.getDetails(event.id);
          emit(MovieInfoLoaded(
            imdbData: BookInfoImdb(
                genre: "genre",
                runtime: "runtime",
                director: "director",
                writer: "writer",
                actors: "actors",
                language: "language",
                awards: "awards",
                released: "released",
                country: "country",
                boxOffice: "boxOffice",
                year: "year",
                rated: "rated",
                plot: "plot",
                production: "production"),
            trailers: [
              TrailerModel(id: "id", site: "site", name: "name", key: "key")
            ],
            backdrops: [ImageBackdrop(image: "image")],
            tmdbData: BookInfoModel(
                tmdbId: "tmdbId",
                overview: "overview",
                title: "title",
                languages: ["sd"],
                backdrops:
                    "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg",
                poster:
                    "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg",
                budget: 200,
                tagline: "tagline",
                rateing: 3,
                dateByMonth: "dateByMonth",
                runtime: 20,
                homepage: "homepage",
                imdbid: "imdbid",
                genres: ["dsj"],
                releaseDate: "releaseDate"),
            cast: [
              CastInfo(
                  name: "name",
                  character: "character",
                  image:
                      "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg",
                  id: "id")
            ],
            similar: [
              BookModel(
                  title: "title",
                  poster:
                      "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg",
                  id: "id",
                  backdrop:
                      "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg",
                  voteAverage: 4.0,
                  releaseDate: "releaseDate")
            ],
          ));
        } on FetchDataError catch (e) {
          emit(MovieInfoError(error: e));
        } catch (e) {
          emit(MovieInfoError(error: FetchDataError(e.toString())));
        }
      }
    });
  }
}
