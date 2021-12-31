import 'package:hive/hive.dart';
import 'package:movieinfo/models/book_model.dart';

class Books {
  static Box<BookModel> getBooks() => Hive.box<BookModel>('Books');
}
