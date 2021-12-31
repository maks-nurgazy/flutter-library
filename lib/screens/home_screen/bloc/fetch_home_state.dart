part of 'fetch_home_bloc.dart';

@immutable
abstract class FetchHomeState {}

class FetchHomeInitial extends FetchHomeState {}

class FetchHomeLoading extends FetchHomeState {}

class FetchHomeLoaded extends FetchHomeState {
  final List<BookModel> tranding;
  final List<BookModel> topRated;
  final List<BookModel> upcoming;
  final List<BookModel> nowPlaying;
  FetchHomeLoaded({
    required this.tranding,
    required this.topRated,
    required this.upcoming,
    required this.nowPlaying,
  });
}

class FetchHomeError extends FetchHomeState {
  final FetchDataError error;
  FetchHomeError({
    required this.error,
  });
}
