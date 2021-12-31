import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/fetch_tv_show_info.dart';
import '../../../models/error_model.dart';
import '../../../models/book_model.dart';
import '../../../models/tv_model.dart';

part 'tv_show_detail_event.dart';
part 'tv_show_detail_state.dart';

class TvShowDetailBloc extends Bloc<TvShowDetailEvent, TvShowDetailState> {
  final FetchTvShowDetail repo = FetchTvShowDetail();

  TvShowDetailBloc() : super(TvShowDetailInitial()) {
    on<TvShowDetailEvent>((event, emit) async {
      if (event is LoadTvInfo) {
        try {
          emit(TvShowDetailLoading());
          // final data = await repo.getTvDetails(event.id);
          emit(TvShowDetailLoaded(
            backdrops: [
              ImageBackdrop(
                  image:
                      "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg")
            ],
            cast: [
              CastInfo(
                  name: "name",
                  character: "character",
                  image:
                      "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg",
                  id: "3")
            ],
            similar: [
              TvModel(
                  title: "title",
                  poster:
                      "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg",
                  id: "id",
                  backdrop:
                      "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg",
                  voteAverage: 3.0,
                  year: "year",
                  releaseDate: "releaseDate")
            ],
            tmdbData: TvInfoModel(
                tmdbId: "tmdbId",
                overview: "overview",
                title: "title",
                languages: ["d"],
                backdrops:
                    "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg",
                poster:
                    "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg",
                tagline: "tagline",
                rateing: 3.0,
                homepage: "homepage",
                genres: ["ds"],
                seasons: [
                  Seasons(
                      overview: "overview",
                      name: "name",
                      id: '12',
                      image:
                          "https://i.pinimg.com/originals/4b/bb/7a/4bbb7aeaabba9c9d23f5c4e33e4eb67b.jpg",
                      date: "date",
                      customOverView: "customOverView",
                      episodes: "episodes",
                      snum: "snum")
                ],
                created: ["created"],
                networks: ["ds"],
                numberOfSeasons: "2",
                date: "date",
                formatedDate: "formatedDate",
                episoderuntime: "episoderuntime"),
            trailers: [
              TrailerModel(id: "id", site: "site", name: "name", key: "key")
            ],
          ));
        } on FetchDataError catch (e) {
          emit(TvShowDetailError(error: e));
        } catch (e) {
          emit(TvShowDetailError(error: FetchDataError(e.toString())));
        }
      }
    });
  }
}
