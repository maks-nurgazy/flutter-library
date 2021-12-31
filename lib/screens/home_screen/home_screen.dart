import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieinfo/animation.dart';
import 'package:movieinfo/widgets/header_text.dart';
import 'package:movieinfo/widgets/horizontal_list_cards.dart';

import '../../models/book_model.dart';
import '../../widgets/movie_home.dart';
import '../../widgets/no_results_found.dart';
import 'bloc/fetch_home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchHomeBloc()..add(FetchHomeData()),
      child: BlocBuilder<FetchHomeBloc, FetchHomeState>(
        builder: (context, state) {
          if (state is FetchHomeLoaded) {
            return HomeScreenWidget(
              topRated: state.topRated,
              nowPlaying: state.nowPlaying,
              tranding: state.tranding,
              upcoming: state.upcoming,
            );
          } else if (state is FetchHomeError) {
            return const ErrorPage();
          } else if (state is FetchHomeLoading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.grey.shade700,
                  strokeWidth: 2,
                  backgroundColor: Colors.cyanAccent,
                ),
              ),
            );
          }
          return const Scaffold();
        },
      ),
    );
  }
}

class HomeScreenWidget extends StatelessWidget {
  final List<BookModel> tranding;
  final List<BookModel> topRated;
  final List<BookModel> upcoming;
  final List<BookModel> nowPlaying;
  const HomeScreenWidget({
    Key? key,
    required this.tranding,
    required this.topRated,
    required this.upcoming,
    required this.nowPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoviesPage(movies: topRated),
            const DelayedDisplay(
                delay: Duration(microseconds: 800),
                child: HeaderText(text: "Recommended")),
            DelayedDisplay(
              delay: const Duration(microseconds: 800),
              child: HorizontalListViewMovies(
                list: topRated,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const HeaderText(text: "Top Rated"),
            HorizontalListViewMovies(
              list: topRated,
            ),
            const SizedBox(
              height: 14,
            ),
            const HeaderText(text: "Recently Returned"),
            HorizontalListViewMovies(
              list: upcoming,
            ),
            const SizedBox(
              height: 14,
            ),
            const HeaderText(text: "Books We love"),
            HorizontalListViewMovies(
              list: nowPlaying,
            )
          ],
        ),
      ),
    );
  }
}
