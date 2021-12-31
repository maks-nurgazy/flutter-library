import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieinfo/hive_models/books.dart';
import 'package:movieinfo/models/book_model.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(BookModelAdapter());
  await Hive.openBox<BookModel>('Books');
  await Hive.openBox('Favorites');
  await Hive.openBox('Genres');
  initializeHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // like this movie detail page?
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.black,
        // scaffoldBackgroundColor: const Color(0xFF0C0303),
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        primaryColor: Colors.cyanAccent,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      builder: (context, child) {
        return MediaQuery(
          child: ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: child!,
          ),
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        );
      },
      home: const BottomNavBar(),
    );
  }
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}

void initializeHive() async {
  var books = [
    BookModel(
      title: "ch",
      poster:
          "https://i.pinimg.com/originals/4a/41/59/4a41598e6c79fad565ce3d72392fec24.jpg",
      id: "2",
      backdrop:
          "https://i.pinimg.com/originals/4a/41/59/4a41598e6c79fad565ce3d72392fec24.jpg",
      voteAverage: 4,
      releaseDate: "3030",
    ),
    BookModel(
      title: "title",
      poster:
          "https://i.pinimg.com/originals/4a/41/59/4a41598e6c79fad565ce3d72392fec24.jpg",
      id: "2",
      backdrop:
          "https://i.pinimg.com/originals/4a/41/59/4a41598e6c79fad565ce3d72392fec24.jpg",
      voteAverage: 4,
      releaseDate: "3030",
    ),
    BookModel(
      title: "third",
      poster:
          "https://i.pinimg.com/originals/4a/41/59/4a41598e6c79fad565ce3d72392fec24.jpg",
      id: "2",
      backdrop:
          "https://i.pinimg.com/originals/4a/41/59/4a41598e6c79fad565ce3d72392fec24.jpg",
      voteAverage: 4,
      releaseDate: "3030",
    ),
  ];

  final box = Books.getBooks();

  if (box.length != books.length) {
    box.clear();
    box.addAll(books);
  }
}
